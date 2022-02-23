import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({required this.car}) : super(CarLoaded(car: car));

  Car car;

  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    print("Event Triggered");
    yield* event.applyAsync(bloc: this);
  }

  static CarBloc of(BuildContext context) => BlocProvider.of<CarBloc>(context);
}
