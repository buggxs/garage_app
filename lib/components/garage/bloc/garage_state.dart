part of 'garage_bloc.dart';

abstract class GarageState extends Equatable {
  const GarageState();
}

class GarageInitial extends GarageState {
  @override
  List<Object> get props => [];
}

class GarageLoadingState extends GarageState {

  @override
  List<Object?> get props => [];
}

class GarageLoadedState extends GarageState {

  final List<Car> cars;

  const GarageLoadedState({required this.cars});

  @override
  List<Object?> get props => [];

}


class GarageEmptyState extends GarageState {

  const GarageEmptyState();

  @override
  List<Object?> get props => [];

}