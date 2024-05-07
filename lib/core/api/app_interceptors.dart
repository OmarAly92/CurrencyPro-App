import 'package:currencypro/core/api/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/app_strings.dart';
import 'end_points.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (EndPoints.currenciesExchangeEndPoints.contains(options.path)) {
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
    } else {
      options
        ..baseUrl = EndPoints.goldPriceBaseUrl
        ..headers[AppStrings.contentType] = AppStrings.applicationJson
        ..responseType = ResponseType.plain
        ..followRedirects = false
        ..headers = {
          EndPoints.headerKeyGoldPrice: EndPoints.apikeyValueGoldPrice,
        }
        ..validateStatus = (status) {
          return status! < StatusCode.internalServerError;
        };
    }

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
