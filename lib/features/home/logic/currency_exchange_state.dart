part of 'currency_exchange_cubit.dart';

sealed class CurrencyExchangeState extends Equatable {
  const CurrencyExchangeState();
}

final class CurrencyExchangeInitial extends CurrencyExchangeState {
  @override
  List<Object> get props => [];
}

final class GetCurrencyExchangeLoading extends CurrencyExchangeState {
  @override
  List<Object> get props => [];
}

final class GetCurrencyExchangeSuccess extends CurrencyExchangeState {
  final CurrencyExchangeModel currencyExchangeModel;

  const GetCurrencyExchangeSuccess({
    required this.currencyExchangeModel,
  });

  @override
  List<Object> get props => [];
}

final class GetCurrencyExchangeFailure extends CurrencyExchangeState {
  final String failureMessage;

  const GetCurrencyExchangeFailure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [];
}
