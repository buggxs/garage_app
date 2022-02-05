part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  Stream<CarState> applyAsync({
    required CarBloc bloc,
  });
}

class LoadingCarEvent extends CarEvent {

  final Car? car;

  const LoadingCarEvent({
    this.car
  });

  @override
  Stream<CarState> applyAsync({required CarBloc bloc}) async* {
    if (car != null) {
      yield CarLoaded(car: car!);
    } else {
      yield const CarError(error: "Car could not be loaded.");
    }


  }

  @override
  List<Object?> get props => [];

}