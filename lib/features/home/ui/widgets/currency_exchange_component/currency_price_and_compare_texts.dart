import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_constants.dart';
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
                TextSpan(text: currencyExchangeModel.rates!['EGP']!.endRate.toStringAsFixed(2)),
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
        Builder(builder: (context) {
          bool isNegativeNum = isNegative(currencyExchangeModel.rates!['EGP']!.changePct);
          final isThereFluctuation = currencyExchangeModel.rates!['EGP']!.changePct.toStringAsFixed(2) == '0.00';
          if (isThereFluctuation) {
            return const SizedBox.shrink();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isNegativeNum ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                  color: isNegativeNum ? AppColors.appRedColor : AppColors.appGreenColor,
                  size: 22,
                ),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.textStyle10.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      const TextSpan(text: 'Buying price'),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: currencyExchangeModel.rates!['EGP']!.endRate.toStringAsFixed(2),
                        style: AppTextStyle.textStyle10.copyWith(
                          color: AppColors.appBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '  '),
                      TextSpan(
                        text:
                            '${AppConstants.currencyNumberPercentFormat(currencyExchangeModel.rates!['EGP']!.changePct)} Compared To The Last Price Yesterday',
                        style: AppTextStyle.textStyle10.copyWith(
                          color: isNegativeNum ? AppColors.appRedColor : AppColors.appGreenColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ],
    );
  }

  bool isNegative(num number) {
    if (number < 0) {
      return true;
    } else {
      return false;
    }
  }
}
