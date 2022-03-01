part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  Stream<CarState> applyAsync({
    required CarBloc bloc,
  });
}

class LoadingCarEvent extends CarEvent {
  final Car? car;

  final log = Logger('LoadingCarEvent');

  LoadingCarEvent({
    this.car,
  });

  @override
  Stream<CarState> applyAsync({required CarBloc bloc}) async* {
    if (car != null) {
      yield CarLoaded(car: car!);
      log.info('car loaded with id ${car?.id}');
    } else {
      log.info('error while loading car');
      yield const CarError(error: "Car could not be loaded.");
    }
  }

  @override
  List<Object?> get props => [
        car,
      ];
}
