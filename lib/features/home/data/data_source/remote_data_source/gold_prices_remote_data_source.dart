import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../model/gold_price_models/gold_price_request_parameters.dart';

abstract class GoldPricesRemoteDataSource {
  Future<Response<dynamic>> getGoldPrice({
    GoldPricesRequestParameters? parameters,
  });
}

class GoldPricesRemoteDataSourceImp implements GoldPricesRemoteDataSource {
  const GoldPricesRemoteDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getGoldPrice({
    GoldPricesRequestParameters? parameters,
  }) async {
    final response = await _dioConsumer.get(
      '/${parameters?.metal ?? 'XAU'}/${parameters?.countryCode ?? 'EGP'}',
    );
    return response;
  }
}
