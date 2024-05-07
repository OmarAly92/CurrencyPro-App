import 'package:equatable/equatable.dart';

class CurrencyExchangeParametersModel extends Equatable {
  final String? symbols;
  final String base;
  final String? startDate;
  final String? endDate;

  const CurrencyExchangeParametersModel({
    this.symbols,
    required this.base,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object> get props => [
        symbols!,
        base,
        startDate!,
        endDate!,
      ];
}
