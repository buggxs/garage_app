part of 'car_property_cubit.dart';

abstract class CarPropertyState extends Equatable {
  const CarPropertyState();
}

class CarPropertyInitial extends CarPropertyState {

  const CarPropertyInitial(this.car);

  final Car car;

  @override
  List<Object> get props => [];
}
