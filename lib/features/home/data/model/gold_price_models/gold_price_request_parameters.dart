import 'package:equatable/equatable.dart';

class GoldPriceRequestParameters extends Equatable {
  final String? metal;
  final String? countryCode;

  const GoldPriceRequestParameters({
    this.metal,
    this.countryCode,
  });

  @override
  List<Object> get props => [metal!, countryCode!];
}
