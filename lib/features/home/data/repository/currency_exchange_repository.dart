import '../../../../core/api/result.dart';

abstract class CurrencyExchangeRepository {
  Future<Result<dynamic>> getCurrencyExchange();
}

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  @override
  Future<Result> getCurrencyExchange() {
    // TODO: implement getCurrencyExchange
    throw UnimplementedError();
  }
}
