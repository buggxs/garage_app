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
  List<Object?> get props => <Object?>[];
}

class GarageLoadingState extends GarageState {
  @override
  List<Object?> get props => <Object?>[];
}

class GarageLoadedState extends GarageState {
  const GarageLoadedState({
    this.cars = const <Car>[],
  }) : carSize = cars.length;

  final List<Car> cars;
  final int carSize;

  @override
  List<Object?> get props => <Object?>[
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

  List<Car>? carsWithWarnings() {
    final List<Car> warningCarsList =
        cars.where((Car tmpCar) => tmpCar.hasAnyWarnings() == true).toList();
    return warningCarsList.isEmpty ? null : warningCarsList;
  }

  String? carBrandsInGarage() {
    final String? brandsList =
        cars.map((Car tmpCar) => tmpCar.brand ?? '').join('\n');
    return (brandsList?.isEmpty ?? true) && (brandsList != '\n')
        ? null
        : brandsList;
  }
}

class GarageEmptyState extends GarageState {
  const GarageEmptyState();

  @override
  List<Object?> get props => <Object?>[];
}
