import 'package:equatable/equatable.dart';

class AllCurrenciesModel extends Equatable {
  final String base;
  final String date;
  final Map<String, num> rates;

  const AllCurrenciesModel({
    required this.base,
    required this.date,
    required this.rates,
  });

  factory AllCurrenciesModel.fromJson(Map<String, dynamic> json) {
    return AllCurrenciesModel(
      base: json['base'] ?? '',
      date: json['date'] ?? '',
      rates: Map<String, num>.from(json['rates'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base': base,
      'date': date,
      'rates': rates,
    };
  }

  @override
  List<Object?> get props => [base, date, rates];
}
