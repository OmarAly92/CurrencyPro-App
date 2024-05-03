import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_view.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_prices_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: const TabBarView(
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
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.currency_exchange,
              color: AppColors.appBlueColor,
            ),
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
