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
