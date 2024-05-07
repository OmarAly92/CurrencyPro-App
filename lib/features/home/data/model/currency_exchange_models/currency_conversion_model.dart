import 'package:equatable/equatable.dart';

class CurrencyConversionModel extends Equatable {
  final String date;
  final num result;
  final bool success;

  const CurrencyConversionModel({
    required this.date,
    required this.result,
    required this.success,
  });

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> json) {
    return CurrencyConversionModel(
      date: json['date'] ?? '',
      result: json['result'] ?? 0,
      success: json['success'] ?? false,
    );
  }

  @override
  List<Object?> get props => [date, result, success];
}
