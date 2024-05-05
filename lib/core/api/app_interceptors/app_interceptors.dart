import 'package:currencypro/core/api/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/app_strings.dart';
import '../end_points.dart';

class CurrencyExchangeInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..baseUrl = EndPoints.exchangeBaseUrl
      ..headers[AppStrings.contentType] = AppStrings.applicationJson
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..headers = {
        EndPoints.headerKeyCurrencies: EndPoints.apikeyValueCurrencies,
      }
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
