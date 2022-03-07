part of 'car_bloc.dart';

abstract class CarState extends Equatable {
  const CarState({this.initialIndex = 0});

  final int initialIndex;
}

class CarInitial extends CarState {
  @override
  List<Object> get props => [];
}

class CarLoading extends CarState {
  @override
  List<Object?> get props => [];
}

class CarLoaded extends CarState {
  final Car car;

  const CarLoaded({
    required this.car,
    int? initialIndex,
  }) : super(initialIndex: initialIndex ?? 0);

  @override
  List<Object?> get props => [
        car,
      ];
}

class CarError extends CarState {
  final String? error;

  const CarError({this.error});

  @override
  List<Object?> get props => [
        error,
      ];
}
