import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class CurrencyExchangeDataSource {
  Future<Response<dynamic>> getCurrencyExchange();
}

class CurrencyExchangeDataSourceImp implements CurrencyExchangeDataSource {
  const CurrencyExchangeDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getCurrencyExchange() async {
    final response = await _dioConsumer.get(
      EndPoints.latest,
      queryParameters: {
        'symbols': 'EGP',
        'base': 'USD',
      },
    );
    return response;
  }
}
