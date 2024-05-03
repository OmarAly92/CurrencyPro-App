import 'package:currencypro/core/utils/app_constants.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/utils/service_locator.dart';
import '../model/currency_exchange_model.dart';
import '../model/currency_exchange_parameters_model.dart';
import '../remote_data_source/currency_exchange_data_source.dart';

abstract class CurrencyExchangeRepository {
  Future<Result<CurrencyExchangeModel>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Result<CurrencyExchangeModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });
}

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  CurrencyExchangeRepositoryImp(this._currencyExchangeDataSource);

  final Logger _logger = sl();
  final CurrencyExchangeDataSource _currencyExchangeDataSource;

  @override
  Future<Result<CurrencyExchangeModel>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    try {
      final rawData = await _currencyExchangeDataSource.getCurrencyExchange(parameters: parameters);
      final result = CurrencyExchangeModel.fromJson(AppConstants.handleResponseAsJson(rawData));
      return Result.success(result);
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Result<CurrencyExchangeModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    try {
      final rawData = await _currencyExchangeDataSource.getAllCurrencies(parameters: parameters);
      final result = CurrencyExchangeModel.fromJson(AppConstants.handleResponseAsJson(rawData));
      return Result.success(result);
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error).failure);
    }
  }
}
