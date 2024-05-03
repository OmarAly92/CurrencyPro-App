import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/model/currencies_list_item_model.dart';
import '../currency_exchange_component/currencies_list_item.dart';

class GoldPricesView extends StatelessWidget {
  const GoldPricesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CurrenciesListItemModel> item = [
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
        widget: Icon(
          Icons.attach_money_rounded,
          color: AppColors.appBlueColor,
        ),
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
        widget: Icon(
          Icons.attach_money_rounded,
          color: AppColors.appBlueColor,
        ),
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
        widget: Icon(
          Icons.attach_money_rounded,
          color: AppColors.appBlueColor,
        ),
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
        widget: Icon(
          Icons.attach_money_rounded,
          color: AppColors.appBlueColor,
        ),
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
        widget: Icon(
          Icons.attach_money_rounded,
          color: AppColors.appBlueColor,
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        slivers: [
          MultiSliver(
            children: [
              const SliverToBoxAdapter(child: Gap(20)),
              SliverList.separated(
                itemCount: item.length,
                separatorBuilder: (BuildContext context, int index) => const Gap(10),
                itemBuilder: (context, index) {
                  return CurrenciesListItem(currenciesListItemModel: item[index]);
                },
              ),
              const SliverToBoxAdapter(child: Gap(20)),
            ],
          ),
        ],
      ),
    );
  }
}
