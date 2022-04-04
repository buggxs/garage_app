part of 'car_cubit.dart';

@immutable
abstract class CarState extends Equatable {}

class CarInitial extends CarState {
  @override
  List<Object?> get props => [];
}

class CarLoadedState extends CarState {
  final Car car;
  final int? tabIndex;
  int? test;

  CarLoadedState({
    required this.car,
    this.tabIndex = 0,
  }) {
    test = car.documentList?[0].length;
  }

  CarLoadedState copyWith({
    Car? car,
    int? tabIndex,
  }) {
    return CarLoadedState(
      car: car ?? this.car,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [
        car,
        tabIndex,
        test,
      ];
}

class CarLoadingState extends CarState {
  @override
  List<Object?> get props => [];
}

class CarErrorState extends CarState {
  final String? error;

  CarErrorState({
    this.error,
  });

  @override
  List<Object?> get props => [error];
}
