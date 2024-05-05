import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../model/widgets_model/convert_currency_parameter_model.dart';
import '../model/widgets_model/currency_exchange_parameters_model.dart';

abstract class CurrencyExchangeDataSource {
  Future<Response<dynamic>> getFluctuationCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Response<dynamic>> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  });

  Future<Response> getConvertCurrency({
    required ConvertCurrencyParameterModel parameters,
  });
}

class CurrencyExchangeDataSourceImp implements CurrencyExchangeDataSource {
  const CurrencyExchangeDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<Response<dynamic>> getFluctuationCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    final response = await _dioConsumer.get(
      EndPoints.fluctuation,
      queryParameters: {
        'start_date': parameters.startDate,
        'end_date': parameters.endDate,
        'symbols': parameters.symbols,
        'base': parameters.base,
      },
    );
    return response;
  }

  @override
  Future<Response> getAllCurrencies({
    required CurrencyExchangeParametersModel parameters,
  }) async {
    final response = await _dioConsumer.get(
      EndPoints.latest,
      queryParameters: {
        'base': parameters.base,
      },
    );
    return response;
  }

  @override
  Future<Response> getConvertCurrency({
    required ConvertCurrencyParameterModel parameters,
  }) async {
    final response = await _dioConsumer.get(
      EndPoints.convert,
      queryParameters: {
        'to': parameters.to,
        'from': parameters.from,
        'amount': parameters.amount,
      },
    );
    return response;
  }
}
