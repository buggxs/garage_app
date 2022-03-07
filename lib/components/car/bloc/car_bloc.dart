import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/properties/cubit/car_property_cubit.dart';
import 'package:logging/logging.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({required this.car})
      : carPropertyCubit = CarPropertyCubit(car: car),
        super(CarLoaded(car: car));

  final log = Logger('CarBloc');

  final CarPropertyCubit carPropertyCubit;

  Car car;

  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    log.info('Event triggered');
    yield* event.applyAsync(bloc: this);
  }

  static CarBloc of(BuildContext context) => BlocProvider.of<CarBloc>(context);
}
