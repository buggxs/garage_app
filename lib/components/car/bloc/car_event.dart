part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  Stream<CarState> applyAsync({
    required CarBloc bloc,
  });
}

class LoadingCarEvent extends CarEvent {
  final Car? car;
  final int? initialIndex;

  final log = Logger('LoadingCarEvent');

  LoadingCarEvent({
    this.car,
    this.initialIndex,
  });

  @override
  Stream<CarState> applyAsync({required CarBloc bloc}) async* {
    if (car != null) {
      yield CarLoaded(car: car!, initialIndex: initialIndex);
      log.info('car loaded with id ${car?.id} on tabIndex $initialIndex');
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
