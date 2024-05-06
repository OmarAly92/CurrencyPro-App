import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<bool> {
  ConnectivityCubit(this._internetConnection) : super(true);

  final InternetConnection _internetConnection;
  late final StreamSubscription<InternetStatus> _streamSubscription;

  void checkConnectivity() {
    _streamSubscription = _internetConnection.onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          emit(true);
          break;
        case InternetStatus.disconnected:
          emit(false);
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
