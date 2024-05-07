import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_body.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeView extends StatefulWidget {
  const CurrencyExchangeView({
    super.key,
  });

  @override
  State<CurrencyExchangeView> createState() => _CurrencyExchangeViewState();
}

class _CurrencyExchangeViewState extends State<CurrencyExchangeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrencyExchangeBody(),
    );
  }
}
