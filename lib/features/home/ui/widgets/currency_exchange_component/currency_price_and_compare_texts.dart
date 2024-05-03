import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../data/model/currency_exchange_model.dart';

class CurrencyPriceAndCompareTexts extends StatelessWidget {
  const CurrencyPriceAndCompareTexts({
    super.key,
    required this.currencyExchangeModel,
  });

  final CurrencyExchangeModel currencyExchangeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.textStyle120.copyWith(
                color: AppColors.appBlueColor,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: currencyExchangeModel.rates!['EGP']!.toStringAsFixed(2)),
                TextSpan(
                  text: 'EGP',
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
