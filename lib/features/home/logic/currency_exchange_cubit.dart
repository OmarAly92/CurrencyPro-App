import 'package:currencypro/core/api/result.dart';
import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/features/home/data/model/all_currencies_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/currency_exchange_parameters_model.dart';
import '../data/model/fluctuation_currencies_model.dart';
import '../data/repository/currency_exchange_repository.dart';

part 'currency_exchange_state.dart';

class CurrencyExchangeCubit extends Cubit<CurrencyExchangeState> {
  CurrencyExchangeCubit(this._currencyExchangeRepository) : super(CurrencyExchangeInitial());

  final CurrencyExchangeRepository _currencyExchangeRepository;

  String symbols = 'EGP';
  String base = 'USD';
  var dateTimeNow = DateTime.now();
  var dateTimeYesterday = DateTime.now().subtract(const Duration(days: 1));

  Future<void> getCurrencyExchange() async {
    emit(GetCurrencyExchangeLoading());
    final fluctuationCurrencies = await _currencyExchangeRepository.getCurrencyExchange(
        parameters: CurrencyExchangeParametersModel(
      symbols: symbols,
      base: base,
      startDate: AppConstants.dateFormat(dateTimeYesterday),
      endDate: AppConstants.dateFormat(dateTimeNow),
    ));
    final allCurrencies = await getAllCurrencies();

    if (fluctuationCurrencies.isSuccess) {
      emit(GetCurrencyExchangeSuccess(
        fluctuationCurrencies: fluctuationCurrencies.value!,
        allCurrencies: allCurrencies.value!,
      ));
    } else {
      emit(GetCurrencyExchangeFailure(failureMessage: fluctuationCurrencies.error.message));
    }
  }

  Future<Result<AllCurrenciesModel>> getAllCurrencies() async {
    final result = await _currencyExchangeRepository.getAllCurrencies(
        parameters: CurrencyExchangeParametersModel(
      symbols: symbols,
      base: base,
    ));
    return result;
  }
}
