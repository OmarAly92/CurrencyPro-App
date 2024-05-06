import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures/local_failure.dart';
import '../../../../core/network/network_status.dart';
import '../../../../core/utils/app_constants.dart';
import '../data_source/local_data_source/gold_price_local_data_source.dart';
import '../data_source/remote_data_source/gold_prices_remote_data_source.dart';
import '../model/gold_price_models/gold_price_model.dart';
import '../model/gold_price_models/gold_price_request_parameters.dart';

abstract class GoldPriceRepository {
  Future<Result<GoldPriceModel>> getGoldPrice({
    GoldPriceRequestParameters? parameters,
  });
}

class GoldPriceRepositoryImp implements GoldPriceRepository {
  GoldPriceRepositoryImp(
    this._goldPriceRemoteDataSource,
    this._logger,
    this._goldPriceLocalDataSource,
    this._networkStatus,
  );

  final Logger _logger;
  final GoldPricesRemoteDataSource _goldPriceRemoteDataSource;
  final GoldPricesLocalDataSource _goldPriceLocalDataSource;
  final NetworkStatus _networkStatus;

  @override
  Future<Result<GoldPriceModel>> getGoldPrice({
    GoldPriceRequestParameters? parameters,
  }) async {
    final isConnected = await _networkStatus.isConnected;
    if (isConnected) {
      final result = await _executeGoldPriceRemoteConnection(parameters: parameters);
      return result;
    } else {
      final result = await _executeGoldPriceLocalConnection();
      return result;
    }
  }

  Future<Result<GoldPriceModel>> _executeGoldPriceRemoteConnection({
    GoldPriceRequestParameters? parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _goldPriceRemoteDataSource.getGoldPrice(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = GoldPriceModel.fromJson(AppConstants.handleResponseAsJson(response));
        await _goldPriceLocalDataSource.cacheGoldPrice(result);
        return Result.success(result);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: statusCode).failureHandler);
    }
  }

  Future<Result<GoldPriceModel>> _executeGoldPriceLocalConnection() async {
    try {
      final result = await _goldPriceLocalDataSource.getGoldPrice();
      return Result.success(result);
    } on LocalFailure catch (error) {
      _logger.e(error);
      return Result.failure(ErrorHandler.handle(error, statusCode: ResponseCode.cacheError).failureHandler);
    }
  }
}
