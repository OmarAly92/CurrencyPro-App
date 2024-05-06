import 'package:currencypro/core/utils/app_constants.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/utils/service_locator.dart';
import '../data_source/remote_data_source/currency_exchange_remote_data_source.dart';
import '../model/currency_exchange_models/all_currencies_model.dart';
import '../model/currency_exchange_models/currency_conversion_model.dart';
import '../model/currency_exchange_models/fluctuation_currencies_model.dart';
import '../model/widgets_model/convert_currency_parameter_model.dart';
import '../model/widgets_model/currency_exchange_parameters_model.dart';

abstract class CurrencyExchangeRepository {
  Future<Result<FluctuationCurrenciesModel>> getFluctuationCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Result<AllCurrenciesModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Result<CurrencyConversionModel>> getConvertCurrency({
    required ConvertCurrencyParameterModel parameters,
  });
}

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  CurrencyExchangeRepositoryImp(this._currencyExchangeDataSource);

  final Logger _logger = sl();
  final CurrencyExchangeRemoteDataSource _currencyExchangeDataSource;

  @override
  Future<Result<FluctuationCurrenciesModel>> getFluctuationCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _currencyExchangeDataSource.getFluctuationCurrencies(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = FluctuationCurrenciesModel.fromJson(AppConstants.handleResponseAsJson(response));
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
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
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }

  @override
  Future<Result<CurrencyConversionModel>> getConvertCurrency({
    required ConvertCurrencyParameterModel parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _currencyExchangeDataSource.getConvertCurrency(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = CurrencyConversionModel.fromJson(AppConstants.handleResponseAsJson(response));
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }
}
