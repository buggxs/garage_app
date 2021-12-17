part of 'car_bloc.dart';

abstract class CarState extends Equatable {
  const CarState();
}

class CarInitial extends CarState {
  @override
  List<Object> get props => [];
}
