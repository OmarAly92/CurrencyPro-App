import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../model/currency_exchange_parameters_model.dart';

abstract class CurrencyExchangeDataSource {
  Future<Response<dynamic>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  });
}

class CurrencyExchangeDataSourceImp implements CurrencyExchangeDataSource {
  const CurrencyExchangeDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getCurrencyExchange({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    final response = await _dioConsumer.get(
      EndPoints.latest,
      queryParameters: {
        'symbols': parameters.symbols,
        'base': parameters.base,
      },
    );
    return response;
  }
}
