import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/core/app_service_locator.dart';

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
