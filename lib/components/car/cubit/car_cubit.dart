import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/properties/cubit/car_property_cubit.dart';
import 'package:garage_app/core/app_service_locator.dart';
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

  void addNoteToCar(String? noteText) {
    if (state is CarLoadedState) {
      Car car = (state as CarLoadedState).car;
      if (noteText?.isNotEmpty ?? false) {
        if (car.noteList?.isEmpty ?? true) {
          car = car.copyWith(
            noteList: <Note>[
              Note(
                id: 1,
                note: noteText!,
              ),
            ],
          );
        } else {
          car.noteList?.add(Note(
            id: car.noteList?.length ?? 0 + 1,
            note: noteText!,
          ));
        }
        app<LocalCarService>().saveCar(car: car);
        emit(CarLoadedState(car: car));
      }
    }
  }

  void addDocumentToCar(Map<String, dynamic>? documentData) {
    if (state is CarLoadedState) {
      Car car = (state as CarLoadedState).car;
      if (documentData?.isNotEmpty ?? false) {
        if (car.documentList?.isEmpty ?? true) {
          //TODO: check in which list document should be saved
          car.documentList = <Document>[
            Document(
              id: 1,
              name: documentData?['name'],
            )
          ].cast<List<Document>>();
        } else {}
        print(documentData);
      }
    }
  }
}
