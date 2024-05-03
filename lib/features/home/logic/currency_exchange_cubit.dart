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

  Future<void> getCurrencyExchange() async {
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
