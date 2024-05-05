abstract class EndPoints {
  /// Exchange Currencies Api
  static const String headerKeyCurrencies = 'apikey';
  static const String apikeyValueCurrencies = 'X3TzOxC1hYTi6hZMjUKB3GV8rifqBaL3';
  static const String exchangeBaseUrl = 'https://api.apilayer.com/exchangerates_data';
  static const String latest = '/latest';
  static const String fluctuation = '/fluctuation';

  /// Gold Price Api

  static const String headerKeyGoldPrice = 'x-access-token';
  static const String apikeyValueGoldPrice = 'goldapi-blc4slvmerzj8-io';
  static const String goldPriceBaseUrl = 'https://www.goldapi.io/api';
  static const String kTEndPoint = 'XAU/EGP';

// x-access-token", "goldapi-blc4slvmerzj8-io
}
