part of 'gold_price_cubit.dart';

sealed class GoldPriceState extends Equatable {
  const GoldPriceState();
}

final class GoldPriceInitial extends GoldPriceState {
  @override
  List<Object> get props => [];
}
