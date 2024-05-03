part of 'currency_exchange_cubit.dart';

sealed class CurrencyExchangeState extends Equatable {
  const CurrencyExchangeState();
}

final class CurrencyExchangeInitial extends CurrencyExchangeState {
  @override
  List<Object> get props => [];
}
