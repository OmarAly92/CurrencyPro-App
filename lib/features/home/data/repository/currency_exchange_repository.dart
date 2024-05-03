import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../model/currency_exchange_model.dart';
import '../remote_data_source/currency_exchange_data_source.dart';

abstract class CurrencyExchangeRepository {
  Future<Result<CurrencyExchangeModel>> getCurrencyExchange();
}

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  CurrencyExchangeRepositoryImp(this._currencyExchangeDataSource);

  final CurrencyExchangeDataSource _currencyExchangeDataSource;

  @override
  Future<Result<CurrencyExchangeModel>> getCurrencyExchange() async {
    try {
      final rawData = await _currencyExchangeDataSource.getCurrencyExchange();
      final result = CurrencyExchangeModel.fromJson(rawData);
      return Result.success(result);
    } catch (error) {
      return Result.failure(ErrorHandler.handle(error).failure);
    }
  }
}
