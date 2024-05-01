import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CurrencyExchangeView extends StatelessWidget {
  const CurrencyExchangeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              Gap(25),
              CurrencyExchangeHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
