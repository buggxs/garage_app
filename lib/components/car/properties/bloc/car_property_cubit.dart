import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/components/car/model/car.dart';

part 'car_property_state.dart';

class CarPropertyCubit extends Cubit<CarPropertyState> {
  CarPropertyCubit(this.car) : super(CarPropertyInitial(car));

  final Car car;

}
