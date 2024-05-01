import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CurrencyExchangeView extends StatelessWidget {
  const CurrencyExchangeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              const Gap(50),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: .5,
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'USD / EGP',
                        style: AppTextStyle.textStyle19.copyWith(
                          color: AppColors.appBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text('Today in the Black Market in Egypt'),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.textStyle120.copyWith(
                            color: AppColors.appBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            const TextSpan(text: '48.08'),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
