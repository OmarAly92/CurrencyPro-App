import 'dart:convert';

import 'package:currencypro/core/error/failures/local_failure.dart';
import 'package:currencypro/features/home/data/model/currency_exchange_models/all_currencies_model.dart';
import 'package:currencypro/features/home/data/model/currency_exchange_models/fluctuation_currencies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_strings.dart';

abstract class CurrencyExchangeLocalDataSource {
  Future<dynamic> getFluctuationCurrencies();

  Future<dynamic> getAllCurrencies();

  Future<void> cacheFluctuationCurrencies(FluctuationCurrenciesModel fluctuationCurrenciesModel);

  Future<void> cacheAllCurrencies(AllCurrenciesModel allCurrenciesModel);
}

class CurrencyExchangeLocalDataSourceImp implements CurrencyExchangeLocalDataSource {
  CurrencyExchangeLocalDataSourceImp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<dynamic> getFluctuationCurrencies() async {
    final jsonQuote = sharedPreferences.getString(AppStrings.cachedFluctuationCurrencies);
    if (jsonQuote != null) {
      final localCacheRandomQuote = FluctuationCurrenciesModel.fromJson(jsonDecode(jsonQuote));
      return localCacheRandomQuote;
    } else {
      throw LocalFailure();
    }
  }

  @override
  Future<dynamic> getAllCurrencies() async {
    final jsonQuote = sharedPreferences.getString(AppStrings.cachedAllCurrencies);
    if (jsonQuote != null) {
      final localCacheRandomQuote = AllCurrenciesModel.fromJson(jsonDecode(jsonQuote));
      return localCacheRandomQuote;
    } else {
      throw LocalFailure();
    }
  }

  @override
  Future<void> cacheFluctuationCurrencies(FluctuationCurrenciesModel fluctuationCurrenciesModel) {
    final Map<String, dynamic> fluctuationCurrenciesMap = fluctuationCurrenciesModel.toJson();
    final String jsonQuote = jsonEncode(fluctuationCurrenciesMap);
    return sharedPreferences.setString(AppStrings.cachedFluctuationCurrencies, jsonQuote);
  }

  @override
  Future<void> cacheAllCurrencies(AllCurrenciesModel allCurrenciesModel) {
    final Map<String, dynamic> allCurrenciesMap = allCurrenciesModel.toJson();
    final String jsonQuote = jsonEncode(allCurrenciesMap);
    return sharedPreferences.setString(AppStrings.cachedAllCurrencies, jsonQuote);
  }
}
