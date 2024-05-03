import 'package:currencypro/features/home/data/remote_data_source/currency_exchange_data_source.dart';
import 'package:currencypro/features/home/data/repository/currency_exchange_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/logic/currency_exchange_cubit.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../network/network_status.dart';

final sl = GetIt.instance;

Future<void> inIt() async {
  /// Features
  // Blocs
  sl.registerFactory(() => CurrencyExchangeCubit(sl()));

  // Repository
  sl.registerLazySingleton<CurrencyExchangeRepository>(() => CurrencyExchangeRepositoryImp(sl()));

  // Data Sources
  sl.registerLazySingleton<CurrencyExchangeDataSource>(() => CurrencyExchangeDataSourceImp(sl()));

  /// Core
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImp(sl()));
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(sl()));

  /// External
  sl.registerLazySingleton<Logger>(() => Logger());
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
