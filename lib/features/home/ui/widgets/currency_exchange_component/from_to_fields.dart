import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                controller: fromController,
                hint: 'Enter Your Number',
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
                controller: toController,
                hint: 'Enter Your Number',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
