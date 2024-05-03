import 'package:currencypro/core/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/currency_exchange_model.dart';
import '../data/model/currency_exchange_parameters_model.dart';
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
    final result = await _currencyExchangeRepository.getCurrencyExchange(
        parameters: CurrencyExchangeParametersModel(
      symbols: symbols,
      base: base,
      startDate: AppConstants.dateFormat(dateTimeYesterday),
      endDate: AppConstants.dateFormat(dateTimeNow),
    ));
    if (result.isSuccess) {
      emit(GetCurrencyExchangeSuccess(currencyExchangeModel: result.value!));
    } else {
      emit(GetCurrencyExchangeFailure(failureMessage: result.error.message));
    }
  }

  Future<void> getAllCurrencies() async {
    emit(GetCurrencyExchangeLoading());
    final result = await _currencyExchangeRepository.getCurrencyExchange(
        parameters: CurrencyExchangeParametersModel(
      symbols: symbols,
      base: base,
    ));
    if (result.isSuccess) {
      emit(GetCurrencyExchangeSuccess(currencyExchangeModel: result.value!));
    } else {
      emit(GetCurrencyExchangeFailure(failureMessage: result.error.message));
    }
  }
}
