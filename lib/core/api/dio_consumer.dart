import 'dart:io';

import 'package:currencypro/core/api/status_code.dart';
import 'package:currencypro/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../error/failures.dart';
import '../utils/service_locator.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer(this.client) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..headers = {
        AppStrings.apikey: AppStrings.apikeyValue,
      }
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(sl<AppInterceptors>());
    // if (kDebugMode) {
    //   client.interceptors.add(sl<LogInterceptor>());
    // }
  }

  final Dio client;

  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.get(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
  }) async {
    final response = await client.post(
      path,
      queryParameters: queryParameters,
      data: formDataIsEnabled ? FormData.fromMap(body!) : body,
    );
    return response;
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final response = await client.put(path, queryParameters: queryParameters, data: body);
    return response;
  }

  @override
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.delete(path, queryParameters: queryParameters);
    return response;
  }

  ServerException handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw const FetchDataException();
        }
      case DioExceptionType.cancel:
        throw const OperationCanceledException();
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const ConnectionErrorException();
      default:
        throw const UnexpectedException();
    }
  }
}
