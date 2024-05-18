import 'package:isar/isar.dart';

part 'fluctuation_currencies_model_isar.g.dart';

@collection
class FluctuationCurrenciesModelIsar {
  Id id = Isar.autoIncrement;
  late bool success;
  late bool fluctuation;
  late String? startDate;
  late String? endDate;
  late String base;
  late CurrencyRateEntry rates;
}

@embedded
class CurrencyRateEntry {
  late String currency;
  late CurrencyRates rates;
}

@embedded
class CurrencyRates {
  late double startRate;
  late double endRate;
  late double change;
  late double changePct;
}
