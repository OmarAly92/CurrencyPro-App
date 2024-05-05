import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/utils/global.dart';
import 'package:currencypro/core/widgets/app_button.dart';
import 'package:currencypro/core/widgets/app_text_field.dart';
import 'package:currencypro/core/widgets/bottom_sheet_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConvertCurrencyBottomSheet extends StatefulWidget {
  const ConvertCurrencyBottomSheet({
    super.key,
  });

  @override
  State<ConvertCurrencyBottomSheet> createState() => _ConvertCurrencyBottomSheetState();
}

class _ConvertCurrencyBottomSheetState extends State<ConvertCurrencyBottomSheet> {
  late final TextEditingController convertController;
  late final TextEditingController fromController;
  late final TextEditingController toController;

  @override
  void initState() {
    super.initState();
    convertController = TextEditingController();
    fromController = TextEditingController(text: fluctuationBase);
    toController = TextEditingController(text: symbols);
  }

  @override
  void dispose() {
    super.dispose();
    convertController.dispose();
    fromController.dispose();
    toController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(15),
                const BottomSheetContainer.centered(),
                const Gap(15),
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
                const Gap(15),
                Row(
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
                ),
              ],
            ),
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.textStyle120.copyWith(
                      color: AppColors.appBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: '0.00'),
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
            ),
            Column(
              children: [
                AppButton.expand(
                  text: 'Convert',
                  onPressed: () {},
                ),
                const Gap(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
