import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../model/gold_price_models/gold_price_model.dart';

abstract class GoldPriceRemoteDataSource {
  Future<Response<dynamic>> getGoldPrice({
    required GoldPriceModel parameters,
  });
}

class GoldPriceRemoteDataSourceImp implements GoldPriceRemoteDataSource {
  const GoldPriceRemoteDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getGoldPrice({
    required GoldPriceModel parameters,
  }) async {
    final response = await _dioConsumer.get(
      EndPoints.kTEndPoint,
      queryParameters: {},
    );
    return response;
  }
}
