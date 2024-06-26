import 'package:currencypro/core/utils/service_locator.dart';
import 'package:currencypro/features/home/data/repository/gold_prices_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Map<String, Object> values = <String, Object>{'counter': 1};
  SharedPreferences.setMockInitialValues(values);
  await ServiceLocator.inIt();
  final GoldPricesRepository goldPriceRepository = sl();

  test("Test Gold Api Request", () async {
    final fetch = (await goldPriceRepository.getGoldPrice()).isSuccess;
    expect(fetch, true);
  });
}
