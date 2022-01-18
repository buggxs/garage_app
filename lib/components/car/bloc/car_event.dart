part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  Stream<CarState> applyAsync({
    required CarBloc bloc,
  });
}

class LoadingCarEvent extends CarEvent {

  final int? carId;

  const LoadingCarEvent({
    this.carId
  });

  @override
  Stream<CarState> applyAsync({required CarBloc bloc}) async* {
    yield CarLoading();

    if (carId != null) {
      Car car = await OnlineCarService().getCarById(carId: carId!);

      yield CarLoaded(car: car);
    } else {
      yield const CarError(error: "Car could not be loaded.");
    }


  }

  @override
  List<Object?> get props => [];

}