import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_prices_body.dart';
import 'package:flutter/material.dart';

class GoldPricesView extends StatefulWidget {
  const GoldPricesView({
    super.key,
  });

  @override
  State<GoldPricesView> createState() => _GoldPricesViewState();
}

class _GoldPricesViewState extends State<GoldPricesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoldPricesBody(),
    );
  }
}
