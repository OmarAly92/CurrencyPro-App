import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/global.dart';
import '../../../data/model/currency_exchange_models/remote/fluctuation_currencies_model.dart';
import 'fluctuation_info_text.dart';

class CurrencyPriceAndCompareTexts extends StatelessWidget {
  const CurrencyPriceAndCompareTexts({
    super.key,
    required this.currencyExchangeModel,
  });

  final FluctuationCurrenciesModel currencyExchangeModel;

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
                TextSpan(
                    text: currencyExchangeModel.rates.rates.endRate
                        .toStringAsFixed(2)),
                TextSpan(
                  text: symbols,
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        FluctuationInfoText(currencyExchangeModel: currencyExchangeModel),
      ],
    );
  }
}
