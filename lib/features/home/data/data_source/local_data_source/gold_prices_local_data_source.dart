import 'dart:convert';

import 'package:currencypro/core/error/failures/local_failure.dart';
import 'package:currencypro/features/home/data/model/gold_price_models/gold_price_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_strings.dart';

abstract class GoldPricesLocalDataSource {
  Future<dynamic> getGoldPrices();

  Future<void> cacheGoldPrices(GoldPricesModel goldPriceModel);
}

class GoldPricesLocalDataSourceImp implements GoldPricesLocalDataSource {
  GoldPricesLocalDataSourceImp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<dynamic> getGoldPrices() async {
    final jsonQuote = sharedPreferences.getString(AppStrings.cachedGoldPrices);
    if (jsonQuote != null) {
      final localCacheRandomQuote = GoldPricesModel.fromJson(jsonDecode(jsonQuote));
      return localCacheRandomQuote;
    } else {
      throw LocalFailure();
    }
  }

  @override
  Future<void> cacheGoldPrices(GoldPricesModel goldPriceModel) {
    final Map<String, dynamic> goldPriceMap = goldPriceModel.toJson();
    final String jsonQuote = jsonEncode(goldPriceMap);
    return sharedPreferences.setString(AppStrings.cachedGoldPrices, jsonQuote);
  }
}
