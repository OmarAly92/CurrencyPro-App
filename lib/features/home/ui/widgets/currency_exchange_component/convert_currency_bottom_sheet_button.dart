import 'package:currencypro/core/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConvertCurrencyBottomSheetButton extends StatelessWidget {
  const ConvertCurrencyBottomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.expand(
          text: 'Convert',
          onPressed: () {},
        ),
        const Gap(10),
      ],
    );
  }
}
