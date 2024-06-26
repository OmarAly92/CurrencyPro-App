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
  final FluctuationCurrenciesModel fluctuationCurrencies;
  final AllCurrenciesModel allCurrencies;

  const GetCurrencyExchangeSuccess({
    required this.fluctuationCurrencies,
    required this.allCurrencies,
  });

  @override
  List<Object> get props => [fluctuationCurrencies, allCurrencies];
}

final class GetCurrencyExchangeFailure extends CurrencyExchangeState {
  final String failureMessage;

  const GetCurrencyExchangeFailure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}

final class GetConvertCurrencyLoading extends CurrencyExchangeState {
  @override
  List<Object> get props => [];
}

final class GetConvertCurrencySuccess extends CurrencyExchangeState {
  final CurrencyConversionModel currencyConversion;

  const GetConvertCurrencySuccess({
    required this.currencyConversion,
  });

  @override
  List<Object> get props => [currencyConversion];
}

final class GetConvertCurrencyFailure extends CurrencyExchangeState {
  final String failureMessage;

  const GetConvertCurrencyFailure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}
