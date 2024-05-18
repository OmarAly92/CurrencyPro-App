import 'package:equatable/equatable.dart';

class AllCurrenciesModel extends Equatable {
  final String base;
  final String date;
  final List<CurrencyRate> rates;

  const AllCurrenciesModel({
    required this.base,
    required this.date,
    required this.rates,
  });

  factory AllCurrenciesModel.fromJson(Map<String, dynamic> json) {
    var ratesList =
        (json['rates'] as Map<String, dynamic>).entries.map((entry) {
      return CurrencyRate(
        currency: entry.key,
        rate: entry.value.toDouble(),
      );
    }).toList();

    return AllCurrenciesModel(
      base: json['base'] ?? '',
      date: json['date'] ?? '',
      rates: ratesList,
    );
  }

  Map<String, dynamic> toJson() {
    var ratesMap = {for (var rate in rates) rate.currency: rate.rate};
    return {
      'base': base,
      'date': date,
      'rates': ratesMap,
    };
  }

  @override
  List<Object?> get props => [base, date, rates];
}

class CurrencyRate extends Equatable {
  final String currency;
  final double rate;

  const CurrencyRate({
    required this.currency,
    required this.rate,
  });

  @override
  List<Object> get props => [currency, rate];
}
