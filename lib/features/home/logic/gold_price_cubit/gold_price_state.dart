part of 'gold_price_cubit.dart';

sealed class GoldPriceState extends Equatable {
  const GoldPriceState();
}

final class GoldPriceInitial extends GoldPriceState {
  @override
  List<Object> get props => [];
}

final class GetGoldPriceLoading extends GoldPriceState {
  @override
  List<Object> get props => [];
}

final class GetGoldPriceSuccess extends GoldPriceState {
  final GoldPriceModel goldPrice;

  const GetGoldPriceSuccess({
    required this.goldPrice,
  });

  @override
  List<Object> get props => [goldPrice];
}

final class GetGoldPriceFailure extends GoldPriceState {
  final String failureMessage;

  const GetGoldPriceFailure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}
