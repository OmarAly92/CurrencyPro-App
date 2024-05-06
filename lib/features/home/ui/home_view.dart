import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_shared_pref.dart';
import 'package:currencypro/features/home/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:currencypro/features/home/logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:currencypro/features/home/ui/connectivity_status_widget.dart';
import 'package:currencypro/features/home/ui/currency_exchange_view.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_prices_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/global.dart';

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
            builder: (context, state) {
              return Row(
                children: [
                  ConnectivityStatusWidget(isConnected: state),
                  const SizedBox(width: 10),
                  PopupMenuButton<String>(
                    enabled: state,
                    tooltip: 'Change Currency',
                    onSelected: (value) {
                      final currencyExchangeCubit = context.read<CurrencyExchangeCubit>();
                      AppSharedPref.setString(AppSharedKeys.symbol, value);
                      symbols = value;
                      allCurrenciesBase = value;
                      currencyExchangeCubit.getCurrencyExchange();
                      context.read<GoldPriceCubit>().getGoldPrice();
                      setState(() {});
                    },
                    itemBuilder: (context) {
                      return AppConstants.getCurrenciesCode().map((item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Center(
                            child: Text(
                              item,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      children: [
                        Text(
                          symbols,
                          style: const TextStyle(
                            color: AppColors.appBlueColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.currency_exchange,
                          color: AppColors.appBlueColor,
                        ),
                      ],
                    ),
                  ),
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
