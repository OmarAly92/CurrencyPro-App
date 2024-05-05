import 'package:currencypro/core/utils/app_constants.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/utils/service_locator.dart';
import '../model/currency_exchange_models/all_currencies_model.dart';
import '../model/currency_exchange_models/fluctuation_currencies_model.dart';
import '../model/currency_exchange_parameters_model.dart';
import '../remote_data_source/currency_exchange_data_source.dart';

abstract class CurrencyExchangeRepository {
  Future<Result<FluctuationCurrenciesModel>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Result<AllCurrenciesModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });
}

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  CurrencyExchangeRepositoryImp(this._currencyExchangeDataSource);

  final Logger _logger = sl();
  final CurrencyExchangeDataSource _currencyExchangeDataSource;

  @override
  Future<Result<FluctuationCurrenciesModel>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _currencyExchangeDataSource.getCurrencyExchange(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = FluctuationCurrenciesModel.fromJson(AppConstants.handleResponseAsJson(response));
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failure);
    }
  }

  @override
  Future<Result<AllCurrenciesModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    int? statusCode;

    try {
      final response = await _currencyExchangeDataSource.getAllCurrencies(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = AllCurrenciesModel.fromJson(AppConstants.handleResponseAsJson(response));
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failure);
    }
  }
}
