import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/components/car/model/air_conditioner_data.dart';
import 'package:garage_app/components/car/model/brake_data.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/car/model/oil_data.dart';
import 'package:garage_app/components/car/model/technical_data.dart';
import 'package:garage_app/components/car/model/timing_belt_data.dart';
import 'package:garage_app/components/car/service/car_service.dart';

part 'garage_event.dart';
part 'garage_state.dart';

class GarageBloc extends Bloc<GarageEvent, GarageState> {

  List<Car>? carList;

  GarageBloc() : super(GarageLoadingState());

  @override
  Stream<GarageState> mapEventToState(GarageEvent event) async* {
    print("Event Triggered");
    yield* event.applyAsync(bloc: this);
  }

  static GarageBloc of(BuildContext context) =>
      BlocProvider.of<GarageBloc>(context);
}
