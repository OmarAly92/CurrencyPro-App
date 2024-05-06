abstract class EndPoints {
  /// Exchange Currencies Api
  static const String headerKeyCurrencies = 'apikey';

  // static const String apikeyValueCurrencies = 'X3TzOxC1hYTi6hZMjUKB3GV8rifqBaL3';
  // static const String apikeyValueCurrencies = 'PcCnuf4Et0n2cSNU0ZDUZL3cFh7VKXf2';
  static const String apikeyValueCurrencies = 'G1PWwkCzW5Tg8NjBr5WQCflQRNo0rk3G';
  static const String exchangeBaseUrl = 'https://api.apilayer.com/exchangerates_data';
  static const String latest = '/latest';
  static const String fluctuation = '/fluctuation';
  static const String convert = '/convert';
  static const List<String> currenciesExchangeEndPoints = [latest, fluctuation, convert];

  /// Gold Price Api
  static const String headerKeyGoldPrice = 'x-access-token';
  static const String apikeyValueGoldPrice = 'goldapi-1e9gslvv1xk46-io';
  static const String goldPriceBaseUrl = 'https://www.goldapi.io/api';
}
