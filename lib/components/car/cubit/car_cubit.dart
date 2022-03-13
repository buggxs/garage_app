import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/properties/cubit/car_property_cubit.dart';
import 'package:meta/meta.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit({
    required this.car,
  })  : carPropertyCubit = CarPropertyCubit(car: car),
        super(CarLoadingState());

  CarPropertyCubit carPropertyCubit;

  Car car;

  static CarCubit of(BuildContext context) =>
      BlocProvider.of<CarCubit>(context);

  void updateTab(int index) {
    if (state is CarLoadedState) {
      emit((state as CarLoadedState).copyWith(tabIndex: index));
    }
  }

  void addNoteToCar(Note note) {
    // TODO: implement add to note
  }
}
