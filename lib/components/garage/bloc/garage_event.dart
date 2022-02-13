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

    List<Car> carList = <Car>[];

    Car car = await app<LocalCarService>().getCarById(carId: 1);

    if (car != null) {
      carList.add(car);
    }

    yield GarageLoadedState(cars: carList);
  }
}

class GarageParkingCarEvent implements GarageEvent {
  final Car _car = Car(
    id: 1,
    name: "Giggolo",
    mileage: 132000,
    date: DateTime(2003, 4, 12),
    vintage: 2003,
    oilData: OilData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    airConditioner: AirConditionerData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    brakeData: BrakeData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 100000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    timingBeltData: TimingBeltData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    technicalData: TechnicalData(
        id: 1, brand: "Audi", model: "A3", type: "abc", hsn: "3nf", tsn: "kl3"),
  );

  final Car? car;

  GarageParkingCarEvent({this.car});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {
    if (bloc.state is GarageLoadedState) {
      //app<LocalCarService>().saveCar(car: _car);

      Car car = await app<LocalCarService>().getCarById(carId: 1);
      print(car);
    }
  }
}
