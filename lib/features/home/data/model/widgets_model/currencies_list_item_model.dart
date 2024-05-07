import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CurrenciesListItemModel extends Equatable {
  final String currencyName;
  final String buyPrice;
  final Widget widget;

  const CurrenciesListItemModel({
    required this.currencyName,
    required this.buyPrice,
    required this.widget,
  });

  @override
  List<Object> get props => [
        currencyName,
        buyPrice,
        widget,
      ];
}
