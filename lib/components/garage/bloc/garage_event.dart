part of 'garage_bloc.dart';

abstract class GarageEvent extends Equatable {
  const GarageEvent();

  Stream<GarageState> applyAsync({
    required GarageBloc bloc,
  });
}

class GarageLoadingParkedCars implements GarageEvent {
  GarageLoadingParkedCars();

  final Logger _log = Logger('GarageLoadingParkedCars');

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {
    yield GarageLoadingState();

    _log.info('Counting cars in garage');

    List<Car> carList = <Car>[];

    Car? car = await app<LocalCarService>().getCarById(carId: 1);

    if (car != null) {
      carList.add(car);
    }

    _log.info('cars loaded (${carList.length})');
    yield GarageLoadedState(cars: carList);
  }
}

class GarageParkingCarEvent implements GarageEvent {
  final log = Logger('GarageParkingCarEvent');

  final Car? car;

  GarageParkingCarEvent({this.car});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {
    if (bloc.state is GarageLoadedState) {
      Car? car = await app<LocalCarService>().getCarById(carId: 1);
      log.info('loaded car (${car?.id})');
    }
  }
}

class GarageUpdateCarEvent implements GarageEvent {
  final String? lastChangeMileageString;
  final String? lastChangeDateString;
  final Car car;

  GarageUpdateCarEvent({
    required this.car,
    this.lastChangeMileageString,
    this.lastChangeDateString,
  });

  final log = Logger('GarageUpdateCarEvent');

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  Stream<GarageState> applyAsync({required GarageBloc bloc}) async* {
    if (bloc.state is GarageLoadedState) {
      var lastChangeDate = lastChangeDateString?.isNotEmpty ?? false
          ? DateFormat('dd.MM.y').parse(lastChangeDateString!)
          : DateTime.now();
      var lastChangeMileage = lastChangeMileageString?.isNotEmpty ?? false
          ? double.tryParse(lastChangeMileageString!)
          : null;

      app<LocalCarService>().saveCar(
        car: car.copyWith(
          mileage: lastChangeMileage,
          date: lastChangeDate,
        ),
      );

      bloc.add(GarageLoadingParkedCars());

      log.info('car with id ${car.id} updated');
    }
  }
}
