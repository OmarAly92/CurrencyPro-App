import 'package:currencypro/core/error/failures/local_failure.dart';
import 'package:currencypro/core/utils/app_constants.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_status.dart';
import '../data_source/local_data_source/currency_exchange_local_data_source.dart';
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
  CurrencyExchangeRepositoryImp(
    this._currencyExchangeDataSource,
    this._networkStatus,
    this._currencyExchangeLocalDataSource,
    this._logger,
  );

  final Logger _logger;
  final CurrencyExchangeRemoteDataSource _currencyExchangeDataSource;
  final CurrencyExchangeLocalDataSource _currencyExchangeLocalDataSource;
  final NetworkStatus _networkStatus;

  @override
  Future<Result<FluctuationCurrenciesModel>> getFluctuationCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    final isConnected = await _networkStatus.isConnected;
    if (isConnected) {
      final result = await _executeFluctuationRemoteConnection(parameters: parameters);
      return result;
    } else {
      final result = await _executeFluctuationLocalConnection();
      return result;
    }
  }

  @override
  Future<Result<AllCurrenciesModel>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    final isConnected = await _networkStatus.isConnected;
    if (isConnected) {
      final result = await _executeAllCurrenciesRemoteConnection(parameters: parameters);
      return result;
    } else {
      final result = await _executeAllCurrenciesLocalConnection();
      return result;
    }
  }

  @override
  Future<Result<CurrencyConversionModel>> getConvertCurrency({
    required ConvertCurrencyParameterModel parameters,
  }) async {
    int? statusCode;
    final isConnected = await _networkStatus.isConnected;
    if (isConnected) {
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
    } else {
      return Result.failure(DataSource.noInternetConnection.getFailure());
    }
  }

  Future<Result<FluctuationCurrenciesModel>> _executeFluctuationRemoteConnection({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _currencyExchangeDataSource.getFluctuationCurrencies(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = FluctuationCurrenciesModel.fromJson(AppConstants.handleResponseAsJson(response));
        _currencyExchangeLocalDataSource.cacheFluctuationCurrencies(result);
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }

  Future<Result<AllCurrenciesModel>> _executeAllCurrenciesRemoteConnection({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    int? statusCode;

    try {
      final response = await _currencyExchangeDataSource.getAllCurrencies(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = AllCurrenciesModel.fromJson(AppConstants.handleResponseAsJson(response));
        _currencyExchangeLocalDataSource.cacheAllCurrencies(result);
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }

  Future<Result<FluctuationCurrenciesModel>> _executeFluctuationLocalConnection() async {
    try {
      final localRandomQuote = await _currencyExchangeLocalDataSource.getFluctuationCurrencies();
      return Result.success(localRandomQuote);
    } on LocalFailure catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: ResponseCode.cacheError).failureHandler);
    }
  }

  Future<Result<AllCurrenciesModel>> _executeAllCurrenciesLocalConnection() async {
    try {
      final localRandomQuote = await _currencyExchangeLocalDataSource.getAllCurrencies();
      return Result.success(localRandomQuote);
    } on LocalFailure catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: ResponseCode.cacheError).failureHandler);
    }
  }
}
