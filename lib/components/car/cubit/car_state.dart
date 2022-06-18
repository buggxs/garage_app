part of 'car_cubit.dart';

@immutable
abstract class CarState extends Equatable {
  final Car? car;
  final int? tabIndex;

  const CarState({
    this.car,
    this.tabIndex = 0,
  });
}

class CarInitial extends CarState {
  const CarInitial() : super();

  @override
  List<Object?> get props => [];
}

class CarLoadingState extends CarState {
  @override
  List<Object?> get props => [];
}

class CarPropertyLoadedState extends CarState {
  const CarPropertyLoadedState({
    required Car car,
  }) : super(
          car: car,
          tabIndex: 0,
        );

  @override
  List<Object?> get props => [
        car,
        tabIndex,
      ];
}

class CarDocumentLoadedState extends CarState {
  const CarDocumentLoadedState({
    Car? car,
  }) : super(
          tabIndex: 1,
          car: car,
        );

  @override
  List<Object?> get props => [
        car,
        tabIndex,
      ];

  CarDocumentLoadedState copyWith({
    Car? car,
  }) {
    return CarDocumentLoadedState(
      car: car ?? this.car,
    );
  }
}

class CarNoteLoadedState extends CarState {
  const CarNoteLoadedState({
    Car? car,
  }) : super(
          tabIndex: 2,
          car: car,
        );

  @override
  List<Object?> get props => [
        car,
        tabIndex,
      ];

  CarNoteLoadedState copyWith({
    Car? car,
  }) {
    return CarNoteLoadedState(
      car: car ?? this.car,
    );
  }
}

class CarErrorState extends CarState {
  final String? error;

  const CarErrorState({
    this.error,
  });

  @override
  List<Object?> get props => [error];
}
