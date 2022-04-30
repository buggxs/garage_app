import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/components/add_vehicle/add_screen.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

part 'garage_event.dart';
part 'garage_state.dart';

class GarageBloc extends Bloc<GarageEvent, GarageState> {
  List<Car>? carList;

  GarageBloc() : super(GarageLoadingState());

  @override
  Stream<GarageState> mapEventToState(GarageEvent event) async* {
    yield* event.applyAsync(bloc: this);
  }

  static GarageBloc of(BuildContext context) =>
      BlocProvider.of<GarageBloc>(context);

  void pushToAddCarScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(
        AddScreen.route,
      );
}
