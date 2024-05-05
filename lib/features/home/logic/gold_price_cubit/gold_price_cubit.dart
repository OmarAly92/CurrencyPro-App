import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gold_price_state.dart';

class GoldPriceCubit extends Cubit<GoldPriceState> {
  GoldPriceCubit() : super(GoldPriceInitial());
}
