import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/properties/cubit/car_property_cubit.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit({
    required this.car,
  })  : carPropertyCubit = CarPropertyCubit(car: car),
        super(CarLoadingState());

  CarPropertyCubit carPropertyCubit;

  var log = Logger("CarCubit");

  Car car;

  static CarCubit of(BuildContext context) =>
      BlocProvider.of<CarCubit>(context);

  void updateTab(int index) {
    if (state is CarLoadedState) {
      emit((state as CarLoadedState).copyWith(tabIndex: index));
    }
  }

  void addNoteToCar(String? noteText) async {
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
        log.info('Added note "$noteText" to car ${car.name}');
        await app<LocalCarService>().saveCar(car: car);
        emit(CarLoadedState(car: car));
      }
    }
  }

  void addDocumentToCar(Map<String, dynamic>? documentData) async {
    if (state is CarLoadedState) {
      Car car = (state as CarLoadedState).car;
      if (documentData?.isNotEmpty ?? false) {
        if (car.documentList?.isEmpty ?? true) {
          switch (documentData!['type']) {
            case 'General documents':
              car.documentList?[0] = <Document>[
                Document(
                  id: 1,
                  name: documentData['name'],
                )
              ];
              break;
            case 'Invoices':
              car.documentList?[1] = <Document>[
                Document(
                  id: 1,
                  name: documentData['name'],
                )
              ];
              break;
            case 'Other documents':
              car.documentList?[2] = <Document>[
                Document(
                  id: 1,
                  name: documentData['name'],
                )
              ];
              break;
            default:
              car.documentList?[0] = <Document>[
                Document(
                  id: 1,
                  name: documentData['name'],
                )
              ];
              break;
          }
        } else {
          switch (documentData!['type']) {
            case 'General documents':
              car.documentList?[0].add(Document(
                id: 1,
                name: documentData['name'],
              ));
              break;
            case 'Invoices':
              car.documentList?[1].add(Document(
                id: 1,
                name: documentData['name'],
              ));
              break;
            case 'Other documents':
              car.documentList?[2].add(Document(
                id: 1,
                name: documentData['name'],
              ));
              break;
            default:
              car.documentList?[0].add(Document(
                id: 1,
                name: documentData['name'],
              ));
              break;
          }
        }
        await app<LocalCarService>().saveCar(car: car);
        emit(CarLoadedState(car: car));
      }
    }
  }
}
