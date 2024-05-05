import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EnterYourNumberField extends StatelessWidget {
  const EnterYourNumberField({
    super.key,
    required this.convertController,
  });

  final TextEditingController convertController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Convert Money',
          style: AppTextStyle.textStyle17.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        AppTextField(
          controller: convertController,
          hint: 'Enter Your Number',
        ),
      ],
    );
  }
}
