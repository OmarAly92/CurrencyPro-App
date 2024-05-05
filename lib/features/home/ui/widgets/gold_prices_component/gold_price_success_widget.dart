import 'package:currencypro/core/utils/app_images.dart';
import 'package:currencypro/features/home/data/model/gold_price_models/gold_price_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../data/model/widgets_model/currencies_list_item_model.dart';
import '../currencies_list_item.dart';

class GoldPriceSuccessWidget extends StatefulWidget {
  const GoldPriceSuccessWidget({
    super.key,
    required this.goldPriceModel,
  });

  final GoldPriceModel goldPriceModel;

  @override
  State<GoldPriceSuccessWidget> createState() => _GoldPriceSuccessWidgetState();
}

class _GoldPriceSuccessWidgetState extends State<GoldPriceSuccessWidget> {
  late List<CurrenciesListItemModel> item;

  @override
  void initState() {
    super.initState();
    item = [
      CurrenciesListItemModel(
        currencyName: '24 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram24k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '22 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram22k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '21 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram21k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '20 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram20k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '18 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram18k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '16 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram16k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '14 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram14k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
      CurrenciesListItemModel(
        currencyName: '10 Karat Gold',
        buyPrice: widget.goldPriceModel.priceGram10k.toStringAsFixed(2),
        widget: Image.asset(
          height: 43,
          width: 43,
          AppImages.goldImage,
          fit: BoxFit.cover,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
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
    );
  }
}
