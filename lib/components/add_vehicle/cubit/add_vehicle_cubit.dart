import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/core/app_service_locator.dart';

part 'add_vehicle_state.dart';

class AddVehicleCubit extends Cubit<AddVehicleState> {
  AddVehicleCubit() : super(AddVehicleInitial());

  final CarService _carService = app<CarService>();

  void saveVehicle({required Car car}) async {
    await _carService.saveCar(car: car);
  }
}
