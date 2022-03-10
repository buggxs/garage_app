import 'package:bloc/bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:meta/meta.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> {
  GarageCubit() : super(GarageLoadingState());
}
