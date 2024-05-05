import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import '../../features/home/ui/home_view.dart';
import '../utils/app_strings.dart';
import '../utils/service_locator.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CurrencyExchangeCubit(sl()),
                ),
                BlocProvider(
                  create: (context) => GoldPriceCubit(sl()),
                ),
              ],
              child: const HomeView(),
            );
          },
        );
    }
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
