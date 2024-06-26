import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/utils/global.dart';
import '../../../data/model/currency_exchange_models/all_currencies_model.dart';
import '../../../data/model/widgets_model/currencies_list_item_model.dart';
import '../currencies_list_item.dart';
import 'sliver_currencies_list_header_row.dart';

class SliverCurrenciesList extends StatefulWidget {
  const SliverCurrenciesList({
    super.key,
    required this.allCurrenciesModel,
  });

  final AllCurrenciesModel allCurrenciesModel;

  @override
  State<SliverCurrenciesList> createState() => _SliverCurrenciesListState();
}

class _SliverCurrenciesListState extends State<SliverCurrenciesList> {
  late Map<String, num> rates;
  late List<String> currenciesCode;

  @override
  void initState() {
    super.initState();
    currenciesCode = [...AppConstants.getCurrenciesCode()];
    currenciesCode.remove(symbols);
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const SliverCurrenciesListHeaderRow(),
        const SliverToBoxAdapter(child: Gap(12)),
        SliverList.separated(
          itemCount: AppConstants.getCurrenciesCode().length - 1,
          separatorBuilder: (BuildContext context, int index) => const Gap(10),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              delay: const Duration(milliseconds: 100),
              position: index,
              child: SlideAnimation(
                duration: const Duration(milliseconds: AppConstants.slideAnimation),
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: AppConstants.fadInAnimation),
                  child: CurrenciesListItem(
                    currenciesListItemModel: CurrenciesListItemModel(
                      currencyName: AppConstants.getCurrencyNameBySymbol(currenciesCode[index]),
                      buyPrice: (1 / widget.allCurrenciesModel.rates[currenciesCode[index]]!).toStringAsFixed(2),
                      widget: Image.asset(
                        height: 35,
                        AppImages.currencyImage,
                      ),
                    ),
                  ),
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
