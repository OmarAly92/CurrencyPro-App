import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class FromToFields extends StatelessWidget {
  const FromToFields({
    super.key,
    required this.fromController,
    required this.toController,
  });

  final TextEditingController fromController;
  final TextEditingController toController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From',
                style: AppTextStyle.textStyle17.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              AppTextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
                controller: fromController,
                hint: 'Enter Currency Symbol',
                hintStyle: AppTextStyle.textStyle13.copyWith(
                  fontSize: 13.2,
                  color: Colors.white54,
                ),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter currency code';
                  } else if (value.toString().length != 3) {
                    return 'must be 3 letters';
                  } else if (!AppConstants.getCurrenciesCode().contains(value)) {
                    return 'Invalid  currency code';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const Gap(15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To',
                style: AppTextStyle.textStyle17.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              AppTextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
                controller: toController,
                hint: 'Enter Currency Symbol',
                hintStyle: AppTextStyle.textStyle13.copyWith(
                  fontSize: 13.2,
                  color: Colors.white54,
                ),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter currency code';
                  } else if (value.toString().length != 3) {
                    return 'must be 3 letters';
                  } else if (!AppConstants.getCurrenciesCode().contains(value)) {
                    return 'Invalid  currency code';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
