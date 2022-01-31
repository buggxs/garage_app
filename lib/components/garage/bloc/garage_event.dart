part of 'garage_bloc.dart';

abstract class GarageEvent extends Equatable {
  const GarageEvent();

  Stream<GarageState> applyAsync({
    required GarageBloc bloc,
  });
}

class GarageLoadingParkedCars implements GarageEvent {

  const GarageLoadingParkedCars();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {

    yield GarageLoadingState();

    List<Car> carList = [];
    Car car = await app<LocalCarService>().getCarById(carId: 1);
    if(car != null) {
      carList.add(car);
    }

    if(carList.isNotEmpty) {
      yield GarageLoadedState(cars: carList);
    }
    else {
      yield const GarageEmptyState();
    }
  }

}


class GarageParkingCarEvent implements GarageEvent {

  final Car? car;

  GarageParkingCarEvent({this.car});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {
    if(bloc.state is GarageLoadedState) {
      app<LocalCarService>().saveCar(car: car!);
    }
  }

}