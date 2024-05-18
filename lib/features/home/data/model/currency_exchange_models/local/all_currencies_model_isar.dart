import 'package:isar/isar.dart';

part 'all_currencies_model_isar.g.dart';

@collection
class AllCurrenciesModelIsar {
  Id id = Isar.autoIncrement;
  late String base;
  late String date;
  late List<CurrencyRate> rates;
}

@embedded
class CurrencyRate {
  late String currency;
  late double rate;
}
