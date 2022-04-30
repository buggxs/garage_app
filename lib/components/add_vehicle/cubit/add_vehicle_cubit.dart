import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_vehicle_state.dart';

class AddVehicleCubit extends Cubit<AddVehicleState> {
  AddVehicleCubit() : super(AddVehicleInitial());
}
