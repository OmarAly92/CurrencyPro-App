import 'package:equatable/equatable.dart';

class CurrenciesListItemModel extends Equatable {
  final String currencyName;
  final String buyPrice;
  final String sellPrice;

  const CurrenciesListItemModel({
    required this.currencyName,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  List<Object> get props => [currencyName, buyPrice, sellPrice];
}
