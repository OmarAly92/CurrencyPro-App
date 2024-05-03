import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/logic/currency_exchange_cubit.dart';
import '../../features/home/ui/home_view.dart';
import '../utils/app_strings.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => CurrencyExchangeCubit(),
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
