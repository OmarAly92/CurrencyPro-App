import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/global.dart';
import '../../../data/model/currency_exchange_models/fluctuation_currencies_model.dart';

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
                  text: currencyExchangeModel.rates![AppStrings.egp]!.endRate.toStringAsFixed(2),
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: '  '),
                TextSpan(
                  text:
                      '${AppConstants.currencyNumberPercentFormat(currencyExchangeModel.rates![AppStrings.egp]!.changePct)} Compared To The Last Price Yesterday',
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
  }

  bool getIsNegativeNum() => isNegative(currencyExchangeModel.rates![symbols]!.changePct);

  bool getIsThereFluctuation() {
    return (currencyExchangeModel.fluctuation &&
        currencyExchangeModel.rates![symbols]!.changePct.toStringAsFixed(2) == '0.00');
  }

  bool isNegative(num number) {
    if (number < 0) {
      return true;
    } else {
      return false;
    }
  }
}
