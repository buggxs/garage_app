part of 'garage_cubit.dart';

@immutable
abstract class GarageState {}

class GarageLoadingState extends GarageState {}

class GarageLoadedState extends GarageState {
  GarageLoadedState({
    this.carList = const <Car>[],
  });

  final List<Car> carList;
}

class GarageErrorState extends GarageState {}
