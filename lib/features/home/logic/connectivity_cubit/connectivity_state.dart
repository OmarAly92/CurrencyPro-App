part of 'connectivity_cubit.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();
}

final class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object> get props => [];
}
