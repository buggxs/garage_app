import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc() : super(CarInitial()) {
    on<CarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
