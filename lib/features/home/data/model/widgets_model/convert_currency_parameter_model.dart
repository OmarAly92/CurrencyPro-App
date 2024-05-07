import 'package:equatable/equatable.dart';

class ConvertCurrencyParameterModel extends Equatable {
  final String to;
  final String from;
  final num amount;

  const ConvertCurrencyParameterModel({
    required this.to,
    required this.from,
    required this.amount,
  });

  @override
  List<Object> get props => [to, from, amount];
}
