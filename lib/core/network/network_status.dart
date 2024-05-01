import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImp implements NetworkStatus {
  NetworkStatusImp(this.internetConnection);

  final InternetConnectionChecker internetConnection;

  @override
  Future<bool> get isConnected async => await internetConnection.hasConnection;
}
