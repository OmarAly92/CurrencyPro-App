part of 'gold_prices_cubit.dart';

sealed class GoldPricesState extends Equatable {
  const GoldPricesState();
}

final class GoldPricesInitial extends GoldPricesState {
  @override
  List<Object> get props => [];
}

final class GetGoldPricesLoading extends GoldPricesState {
  @override
  List<Object> get props => [];
}

final class GetGoldPricesSuccess extends GoldPricesState {
  final GoldPricesModel goldPrice;

  const GetGoldPricesSuccess({
    required this.goldPrice,
  });

  @override
  List<Object> get props => [goldPrice];
}

final class GetGoldPricesFailure extends GoldPricesState {
  final String failureMessage;

  const GetGoldPricesFailure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}
