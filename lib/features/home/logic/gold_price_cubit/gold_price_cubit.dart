import 'package:currencypro/features/home/data/repository/gold_price_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/gold_price_models/gold_price_model.dart';
import '../../data/model/gold_price_models/gold_price_request_parameters.dart';

part 'gold_price_state.dart';

class GoldPriceCubit extends Cubit<GoldPriceState> {
  GoldPriceCubit(this._goldPriceRepository) : super(GoldPriceInitial());
  final GoldPriceRepository _goldPriceRepository;

  Future<void> getGoldPrice({GoldPriceRequestParameters? parameters}) async {
    emit(GetGoldPriceLoading());
    final result = await _goldPriceRepository.getGoldPrice(parameters: parameters);
    if (result.isSuccess) {
      emit(GetGoldPriceSuccess(goldPrice: result.value!));
    } else {
      emit(GetGoldPriceFailure(failureMessage: result.error.message));
    }
  }
}
