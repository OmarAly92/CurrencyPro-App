import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../data/model/currencies_list_item_model.dart';

class CurrenciesListItem extends StatelessWidget {
  const CurrenciesListItem({
    super.key,
    required this.currenciesListItemModel,
  });

  final CurrenciesListItemModel currenciesListItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .2,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondaryColor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.appBlueColor,
              ),
            ),
            child: Center(
              child: currenciesListItemModel.widget,
            ),
          ),
        ),
        title: Text(
          currenciesListItemModel.currencyName,
          style: AppTextStyle.textStyle13,
        ),
        subtitle: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: AppTextStyle.textStyle13,
            children: [
              const TextSpan(
                text: 'Buy',
                style: AppTextStyle.textStyle11,
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: currenciesListItemModel.buyPrice,
                style: AppTextStyle.textStyle13.copyWith(
                  color: AppColors.appBlueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(text: '    '),
              const TextSpan(
                text: 'Sell',
                style: AppTextStyle.textStyle11,
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: currenciesListItemModel.sellPrice,
                style: AppTextStyle.textStyle13.copyWith(
                  color: AppColors.appBlueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
