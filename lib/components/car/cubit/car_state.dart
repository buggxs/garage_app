part of 'car_cubit.dart';

@immutable
abstract class CarState {}

class CarInitial extends CarState {}

class CarLoadedState extends CarState {
  final Car car;
  final int? tabIndex;

  CarLoadedState({
    required this.car,
    this.tabIndex = 0,
  });

  CarLoadedState copyWith({
    Car? car,
    int? tabIndex,
  }) {
    return CarLoadedState(
      car: car ?? this.car,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}

class CarLoadingState extends CarState {}

class CarErrorState extends CarState {
  final String? error;

  CarErrorState({
    this.error,
  });
}
