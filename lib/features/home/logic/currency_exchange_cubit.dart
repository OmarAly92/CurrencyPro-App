import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_exchange_state.dart';

class CurrencyExchangeCubit extends Cubit<CurrencyExchangeState> {
  CurrencyExchangeCubit() : super(CurrencyExchangeInitial());
}
