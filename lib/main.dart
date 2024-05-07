import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/app_routes/app_router.dart';
import 'core/app_themes/app_themes.dart';
import 'core/utils/app_shared_pref.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart';
import 'features/home/logic/connectivity_cubit/connectivity_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.inIt();
  await AppSharedPref.init();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(sl())..checkConnectivity(),
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.dark(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
