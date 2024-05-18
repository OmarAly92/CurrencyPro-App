import 'package:equatable/equatable.dart';

class FluctuationCurrenciesModel extends Equatable {
  final bool success;
  final bool fluctuation;
  final String? startDate;
  final String? endDate;
  final String base;
  final CurrencyRateEntry rates;

  const FluctuationCurrenciesModel({
    required this.success,
    required this.fluctuation,
    this.startDate,
    this.endDate,
    required this.base,
    required this.rates,
  });

  factory FluctuationCurrenciesModel.fromJson(Map<String, dynamic> json) {
    var rates = CurrencyRateEntry(
      currency: json['rates'].keys.first,
      rates: CurrencyRates.fromJson(json['rates'].values.first),
    );

    return FluctuationCurrenciesModel(
      success: json['success'] ?? false,
      fluctuation: json['fluctuation'] ?? false,
      startDate: json['start_date'],
      endDate: json['end_date'],
      base: json['base'] ?? '',
      rates: rates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'fluctuation': fluctuation,
      'start_date': startDate,
      'end_date': endDate,
      'base': base,
      'rates': {rates.currency: rates.rates.toJson()},
    };
  }

  @override
  List<Object?> get props =>
      [success, fluctuation, startDate, endDate, base, rates];
}

class CurrencyRateEntry extends Equatable {
  final String currency;
  final CurrencyRates rates;

  const CurrencyRateEntry({
    required this.currency,
    required this.rates,
  });

  @override
  List<Object> get props => [currency, rates];
}

class CurrencyRates extends Equatable {
  final num startRate;
  final num endRate;
  final num change;
  final num changePct;

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

  Map<String, dynamic> toJson() {
    return {
      'start_rate': startRate,
      'end_rate': endRate,
      'change': change,
      'change_pct': changePct,
    };
  }

  @override
  List<Object?> get props => [startRate, endRate, change, changePct];
}
