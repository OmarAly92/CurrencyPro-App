import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../model/gold_price_models/gold_price_request_parameters.dart';

abstract class GoldPriceRemoteDataSource {
  Future<Response<dynamic>> getGoldPrice({
    required GoldPriceRequestParameters parameters,
  });
}

class GoldPriceRemoteDataSourceImp implements GoldPriceRemoteDataSource {
  const GoldPriceRemoteDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getGoldPrice({
    required GoldPriceRequestParameters parameters,
  }) async {
    final response = await _dioConsumer.get(
      '${parameters.metal}/${parameters.countryCode}',
      queryParameters: {},
    );
    return response;
  }
}
