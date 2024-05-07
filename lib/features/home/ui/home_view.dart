import 'package:currencypro/features/home/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/connectivity_status_widget.dart';
import 'package:currencypro/features/home/ui/currency_exchange_view.dart';
import 'package:currencypro/features/home/ui/gold_prices_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_text_style.dart';
import 'widgets/currency_exchange_component/change_currency_popup_menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CurrencyExchangeView(),
            GoldPricesView(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Today\'s Souq',
        style: AppTextStyle.textStyle23,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<ConnectivityCubit, bool>(
            builder: (context, isConnected) {
              return Row(
                children: [
                  ConnectivityStatusWidget(isConnected: isConnected),
                  const SizedBox(width: 10),
                  ChangeCurrencyPopupMenu(isConnected: isConnected),
                ],
              );
            },
          ),
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Currency Exchange'),
          Tab(text: 'Gold Prices'),
        ],
      ),
    );
  }
}
