import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures/local_failure.dart';
import '../../../../core/network/network_status.dart';
import '../../../../core/utils/app_constants.dart';
import '../data_source/local_data_source/gold_prices_local_data_source.dart';
import '../data_source/remote_data_source/gold_prices_remote_data_source.dart';
import '../model/gold_price_models/gold_price_model.dart';
import '../model/gold_price_models/gold_price_request_parameters.dart';

abstract class GoldPricesRepository {
  Future<Result<GoldPricesModel>> getGoldPrice({
    GoldPricesRequestParameters? parameters,
  });
}

class GoldPricesRepositoryImp implements GoldPricesRepository {
  GoldPricesRepositoryImp(
    this._goldPricesRemoteDataSource,
    this._logger,
    this._goldPricesLocalDataSource,
    this._networkStatus,
  );

  final Logger _logger;
  final GoldPricesRemoteDataSource _goldPricesRemoteDataSource;
  final GoldPricesLocalDataSource _goldPricesLocalDataSource;
  final NetworkStatus _networkStatus;

  @override
  Future<Result<GoldPricesModel>> getGoldPrice({
    GoldPricesRequestParameters? parameters,
  }) async {
    final isConnected = await _networkStatus.isConnected;
    if (isConnected) {
      final result = await _executeGoldPricesRemoteConnection(parameters: parameters);
      return result;
    } else {
      final result = await _executeGoldPricesLocalConnection();
      return result;
    }
  }

  Future<Result<GoldPricesModel>> _executeGoldPricesRemoteConnection({
    GoldPricesRequestParameters? parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _goldPricesRemoteDataSource.getGoldPrice(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = GoldPricesModel.fromJson(AppConstants.handleResponseAsJson(response));
        await _goldPricesLocalDataSource.cacheGoldPrices(result);
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }

  Future<Result<GoldPricesModel>> _executeGoldPricesLocalConnection() async {
    try {
      final result = await _goldPricesLocalDataSource.getGoldPrices();
      return Result.success(result);
    } on LocalFailure catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: ResponseCode.cacheError).failureHandler);
    }
  }
}
