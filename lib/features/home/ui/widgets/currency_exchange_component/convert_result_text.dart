import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/currency_exchange_models/currency_conversion_model.dart';

class ConvertResultText extends StatelessWidget {
  const ConvertResultText({
    super.key,
    this.currencyConversionModel,
  });

  final CurrencyConversionModel? currencyConversionModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RichText(
          text: TextSpan(
            style: AppTextStyle.textStyle120.copyWith(
              color: AppColors.appBlueColor,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(text: currencyConversionModel?.result.toStringAsFixed(2) ?? '0.00'),
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
    );
  }
}
