import 'package:equatable/equatable.dart';

class CurrencyExchangeParametersModel extends Equatable {
  final String symbols;
  final String base;

  const CurrencyExchangeParametersModel({
    required this.symbols,
    required this.base,
  });

  @override
  List<Object> get props => [symbols, base];
}
