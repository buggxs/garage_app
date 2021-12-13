import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'garage_event.dart';
part 'garage_state.dart';

class GarageBloc extends Bloc<GarageEvent, GarageState> {
  GarageBloc() : super(GarageInitial()) {
    on<GarageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
