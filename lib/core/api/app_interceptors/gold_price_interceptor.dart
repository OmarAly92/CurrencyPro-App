import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utils/app_strings.dart';
import '../end_points.dart';
import '../status_code.dart';

class GoldPriceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
