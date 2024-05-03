import 'package:equatable/equatable.dart';

class CurrencyExchangeModel extends Equatable {
  final bool success;
  final int timestamp;
  final String base;
  final String date;
  final Map<String, double>? rates;

  const CurrencyExchangeModel({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.date,
    this.rates,
  });

  factory CurrencyExchangeModel.fromJson(Map<String, dynamic> json) {
    return CurrencyExchangeModel(
      success: json['success'] ?? false,
      timestamp: json['timestamp'] ?? 0,
      base: json['base'] ?? '',
      date: json['date'] ?? '',
      rates: json['rates'] != null ? Map<String, double>.from(json['rates']) : null,
    );
  }

  @override
  List<Object?> get props => [success, timestamp, base, date, rates];
}
