import 'package:equatable/equatable.dart';

class CurrencyExchangeModel extends Equatable {
  final bool success;
  final bool fluctuation;
  final String? startDate;
  final String? endDate;
  final String base;
  final Map<String, CurrencyRates>? rates;

  const CurrencyExchangeModel({
    required this.success,
    required this.fluctuation,
    this.startDate,
    this.endDate,
    required this.base,
    this.rates,
  });

  factory CurrencyExchangeModel.fromJson(Map<String, dynamic> json) {
    return CurrencyExchangeModel(
      success: json['success'] ?? false,
      fluctuation: json['fluctuation'] ?? false,
      startDate: json['start_date'],
      endDate: json['end_date'],
      base: json['base'] ?? '',
      rates: json['rates'] != null
          ? (json['rates'] as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, CurrencyRates.fromJson(value)))
          : null,
    );
  }

  @override
  List<Object?> get props => [success, fluctuation, startDate, endDate, base, rates];
}

class CurrencyRates extends Equatable {
  final double startRate;
  final double endRate;
  final double change;
  final double changePct;

  const CurrencyRates({
    required this.startRate,
    required this.endRate,
    required this.change,
    required this.changePct,
  });

  factory CurrencyRates.fromJson(Map<String, dynamic> json) {
    return CurrencyRates(
      startRate: json['start_rate'] ?? 0.0,
      endRate: json['end_rate'] ?? 0.0,
      change: json['change'] ?? 0.0,
      changePct: json['change_pct'] ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [startRate, endRate, change, changePct];
}
