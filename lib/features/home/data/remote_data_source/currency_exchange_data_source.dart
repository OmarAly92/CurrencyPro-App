import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class CurrencyExchangeDataSource {
  Future<dynamic> getCurrencyExchange();
}

class CurrencyExchangeDataSourceImp implements CurrencyExchangeDataSource {
  const CurrencyExchangeDataSourceImp(this._dioConsumer);

  final DioConsumer _dioConsumer;

  @override
  Future<dynamic> getCurrencyExchange() async {
    final response = await _dioConsumer.get(
      EndPoints.latest,
      queryParameters: {
        'symbols': 'EGP',
        'base': 'USD',
      },
    );
    return response.data;
  }
}
