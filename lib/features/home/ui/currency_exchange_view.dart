import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../core/widgets/app_refresh_indicator.dart';
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
  Future<void> refreshState() async {
    context.read<CurrencyExchangeCubit>().getCurrencyExchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRefreshIndicator(
        onRefresh: () async => await refreshState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<CurrencyExchangeCubit, CurrencyExchangeState>(
                builder: (context, state) {
                  if (state is GetCurrencyExchangeLoading) {
                    return const SliverToBoxAdapter(child: CurrencyExchangeLoadingShimmer());
                  } else if (state is GetCurrencyExchangeSuccess) {
                    return MultiSliver(
                      children: [
                        const SliverToBoxAdapter(child: Gap(25)),
                        SliverToBoxAdapter(
                          child: CurrencyExchangeHeader(
                            fluctuationCurrencies: state.fluctuationCurrencies,
                          ),
                        ),
                        const SliverToBoxAdapter(child: Gap(25)),
                        SliverCurrenciesList(allCurrenciesModel: state.allCurrencies),
                      ],
                    );
                  } else if (state is GetCurrencyExchangeFailure) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          Text(state.failureMessage),
                          const SizedBox(height: 50),
                        ],
                      ),
                    );
                  } else {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox.shrink(),
                          Text('Unknown State'),
                          SizedBox(height: 50),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
