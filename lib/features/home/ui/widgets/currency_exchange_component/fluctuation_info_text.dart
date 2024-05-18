import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../data/model/currency_exchange_models/remote/fluctuation_currencies_model.dart';

class FluctuationInfoText extends StatelessWidget {
  const FluctuationInfoText({super.key, required this.currencyExchangeModel});

  final FluctuationCurrenciesModel currencyExchangeModel;

  @override
  Widget build(BuildContext context) {
    final isNegativeNum = getIsNegativeNum();
    final isThereFluctuation = getIsThereFluctuation();
    if (isThereFluctuation) {
      return const SizedBox.shrink();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isNegativeNum ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
            color:
                isNegativeNum ? AppColors.appRedColor : AppColors.appGreenColor,
            size: 22,
          ),
          RichText(
            text: TextSpan(
              style: AppTextStyle.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 10.5,
              ),
              children: [
                const TextSpan(text: 'Buying price'),
                const TextSpan(text: ' '),
                TextSpan(
                  text: currencyExchangeModel.rates.rates.endRate
                      .toStringAsFixed(2),
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.5,
                  ),
                ),
                const TextSpan(text: '  '),
                TextSpan(
                  text:
                      '${AppConstants.currencyNumberPercentFormat(currencyExchangeModel.rates.rates.changePct)} Compared To The Last Week Price',
                  style: AppTextStyle.textStyle10.copyWith(
                    color: isNegativeNum
                        ? AppColors.appRedColor
                        : AppColors.appGreenColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  bool getIsNegativeNum() =>
      isNegative(currencyExchangeModel.rates.rates.changePct);

  bool getIsThereFluctuation() {
    return (currencyExchangeModel.fluctuation &&
        currencyExchangeModel.rates.rates.changePct.toStringAsFixed(2) ==
            '0.00');
  }

  bool isNegative(num number) {
    if (number < 0) {
      return true;
    } else {
      return false;
    }
  }
}
