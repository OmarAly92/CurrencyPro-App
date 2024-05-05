import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'widgets/currency_exchange_component/currency_exchange_header.dart';
import 'widgets/currency_exchange_component/sliver_currencies_list.dart';

class CurrencyExchangeView extends StatefulWidget {
  const CurrencyExchangeView({
    super.key,
  });

  @override
  State<CurrencyExchangeView> createState() => _CurrencyExchangeViewState();
}

class _CurrencyExchangeViewState extends State<CurrencyExchangeView> {
  @override
  void initState() {
    super.initState();
    context.read<CurrencyExchangeCubit>().getCurrencyExchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: BlocBuilder<CurrencyExchangeCubit, CurrencyExchangeState>(
            builder: (context, state) {
              if (state is GetCurrencyExchangeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetCurrencyExchangeSuccess) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: Gap(25)),
                    SliverToBoxAdapter(
                        child: CurrencyExchangeHeader(
                      fluctuationCurrencies: state.fluctuationCurrencies,
                    )),
                    const SliverToBoxAdapter(child: Gap(25)),
                    SliverCurrenciesList(allCurrenciesModel: state.allCurrencies),
                  ],
                );
              } else if (state is GetCurrencyExchangeFailure) {
                return Center(child: Text(state.failureMessage));
              } else {
                return const Center(child: Text('unknown State'));
              }
            },
          ),
        ),
      ),
    );
  }
}
