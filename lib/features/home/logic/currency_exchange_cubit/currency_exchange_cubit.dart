import 'package:currencypro/core/api/result.dart';
import 'package:currencypro/core/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/global.dart';
import '../../data/model/currency_exchange_models/remote/all_currencies_model.dart';
import '../../data/model/currency_exchange_models/remote/currency_conversion_model.dart';
import '../../data/model/currency_exchange_models/remote/fluctuation_currencies_model.dart';
import '../../data/model/widgets_model/convert_currency_parameter_model.dart';
import '../../data/model/currency_exchange_parameters_model.dart';
import '../../data/repository/currency_exchange_repository.dart';

part 'currency_exchange_state.dart';

class CurrencyExchangeCubit extends Cubit<CurrencyExchangeState> {
  CurrencyExchangeCubit(this._currencyExchangeRepository)
      : super(CurrencyExchangeInitial());

  final CurrencyExchangeRepository _currencyExchangeRepository;
  final _dateTimeNow = DateTime.now();
  final _dateTimeYesterday = DateTime.now().subtract(const Duration(days: 7));

  Future<void> getCurrencyExchange() async {
    emit(GetCurrencyExchangeLoading());
    final fluctuationCurrencies = await _getFluctuationCurrencies();
    final allCurrencies = await _getAllCurrencies();
    if (fluctuationCurrencies.isSuccess && allCurrencies.isSuccess) {
      emit(GetCurrencyExchangeSuccess(
        fluctuationCurrencies: fluctuationCurrencies.value!,
        allCurrencies: allCurrencies.value!,
      ));
    } else {
      emit(GetCurrencyExchangeFailure(
          failureMessage: fluctuationCurrencies.error.message));
    }
  }

  Future<void> getConvertCurrency(
      {required ConvertCurrencyParameterModel parameters}) async {
    emit(GetConvertCurrencyLoading());
    final result = await _currencyExchangeRepository.getConvertCurrency(
        parameters: parameters);
    if (result.isSuccess) {
      emit(GetConvertCurrencySuccess(currencyConversion: result.value!));
    } else {
      emit(GetConvertCurrencyFailure(failureMessage: result.error.message));
    }
  }

  Future<Result<FluctuationCurrenciesModel>> _getFluctuationCurrencies() async {
    final result = await _currencyExchangeRepository.getFluctuationCurrencies(
        parameters: CurrencyExchangeParametersModel(
      symbols: fluctuationBase == symbols ? 'EUR' : symbols,
      base: fluctuationBase,
      startDate: AppConstants.dateFormat(_dateTimeYesterday),
      endDate: AppConstants.dateFormat(_dateTimeNow),
    ));
    return result;
  }

  Future<Result<AllCurrenciesModel>> _getAllCurrencies() async {
    final result = await _currencyExchangeRepository.getAllCurrencies(
        parameters: CurrencyExchangeParametersModel(
      base: symbols,
    ));
    return result;
  }
}
