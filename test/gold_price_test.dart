import 'package:currencypro/core/utils/service_locator.dart';
import 'package:currencypro/features/home/data/repository/gold_price_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.inIt();
  final GoldPriceRepository goldPriceRepository = sl();

  test("Test Gold Api Request", () async {
    final fetch = (await goldPriceRepository.getGoldPrice()).isSuccess;
    expect(fetch, true);
  });
}
