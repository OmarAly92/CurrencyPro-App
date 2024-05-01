import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../network/network_status.dart';

final sl = GetIt.instance;

Future<void> inIt() async {
  /// Features
  // Blocs

  // sl.registerFactory(() => QuoteCubit(sl()));

  // Use Cases

  // sl.registerLazySingleton<GetRandomQuoteUseCases>(() => GetRandomQuoteUseCases(sl()));


  // Repository


  // Data Sources


  /// Core
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImp(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));

  /// External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
}
