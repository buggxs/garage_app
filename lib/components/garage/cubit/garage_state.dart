part of 'garage_cubit.dart';

abstract class GarageState extends Equatable {
  const GarageState();
}

class GarageErrorState extends GarageState {
  const GarageErrorState({
    this.message,
  });

  final String? message;

  @override
  List<Object> get props => [];
}

class GarageLoadingState extends GarageState {
  @override
  List<Object?> get props => [];
}

class GarageLoadedState extends GarageState {
  final List<Car> cars;
  final int carSize;

  const GarageLoadedState({
    this.cars = const <Car>[],
  }) : carSize = cars.length;

  @override
  List<Object?> get props => [
        cars,
        carSize,
      ];

  GarageLoadedState copyWith({
    List<Car>? cars,
  }) {
    return GarageLoadedState(
      cars: cars ?? this.cars,
    );
  }
}

class GarageEmptyState extends GarageState {
  const GarageEmptyState();

  @override
  List<Object?> get props => [];
}
