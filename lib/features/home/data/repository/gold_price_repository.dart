import 'package:currencypro/features/home/data/remote_data_source/gold_price_data_source.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/service_locator.dart';
import '../model/gold_price_models/gold_price_model.dart';
import '../model/gold_price_models/gold_price_request_parameters.dart';

abstract class GoldPriceRepository {
  Future<Result<GoldPriceModel>> getGoldPrice({
    required GoldPriceRequestParameters parameters,
  });
}

class GoldPriceRepositoryImp implements GoldPriceRepository {
  GoldPriceRepositoryImp(this._goldPriceRemoteDataSource);

  final Logger _logger = sl();
  final GoldPriceRemoteDataSource _goldPriceRemoteDataSource;

  @override
  Future<Result<GoldPriceModel>> getGoldPrice({
    required GoldPriceRequestParameters parameters,
  }) async {
    int? statusCode;
    try {
      final response = await _goldPriceRemoteDataSource.getGoldPrice(parameters: parameters);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final result = GoldPriceModel.fromJson(AppConstants.handleResponseAsJson(response));
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
