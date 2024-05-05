import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/sliver_currencies_list_header_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/model/all_currencies_model.dart';
import '../../../data/model/currencies_list_item_model.dart';
import '../currencies_list_item.dart';

class SliverCurrenciesList extends StatelessWidget {
  const SliverCurrenciesList({
    super.key,
    required this.allCurrenciesModel,
  });

  final AllCurrenciesModel allCurrenciesModel;

  @override
  Widget build(BuildContext context) {
    final List<String> currenciesCode = AppConstants.getCurrenciesCode();
    return MultiSliver(
      children: [
        const SliverCurrenciesListHeaderRow(),
        const SliverToBoxAdapter(child: Gap(12)),
        SliverList.separated(
          itemCount: currenciesCode.length,
          separatorBuilder: (BuildContext context, int index) => const Gap(10),
          itemBuilder: (context, index) {
            return CurrenciesListItem(
              currenciesListItemModel: CurrenciesListItemModel(
                currencyName: AppConstants.getCurrencyNameBySymbol(currenciesCode[index]),
                buyPrice: (1 / allCurrenciesModel.rates[currenciesCode[index]]!).toStringAsFixed(2),
                widget: const Icon(
                  Icons.attach_money_rounded,
                  color: AppColors.appBlueColor,
                ),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: Gap(25)),
      ],
    );
  }
}
