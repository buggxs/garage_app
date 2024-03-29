import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> with LoggerMixin {
  CarCubit({
    required this.car,
  }) : super(CarPropertyLoadedState(car: car));

  Car car;

  static CarCubit of(BuildContext context) =>
      BlocProvider.of<CarCubit>(context);

  void updateTab(int index) {
    switch (index) {
      case 0:
        emit(CarPropertyLoadedState(car: car));
        break;
      case 1:
        emit(CarDocumentLoadedState(car: car));
        break;
      case 2:
        emit(CarNoteLoadedState(car: car));
        break;
      default:
        emit(CarPropertyLoadedState(car: car));
        break;
    }
    log.info('Showing tab with index: $index');
  }

  Future<void> addNoteToCar(String? noteText) async {
    if (state is CarNoteLoadedState) {
      Car? car = state.car;
      if (car == null) {
        emit(const CarErrorState());
        return;
      }
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
          car.noteList?.add(
            Note(
              id: car.noteList?.length ?? 0 + 1,
              note: noteText!,
            ),
          );
        }
        log.info('Added note "$noteText" to car ${car.name}');
        await app<CarService>().saveCar(car: car);
        emit(
          (state as CarNoteLoadedState).copyWith(
            car: car,
          ),
        );
      }
    }
  }

  Future<void> addDocumentToCar(Map<String, dynamic>? documentData) async {
    if (state is CarDocumentLoadedState) {
      final Car? car = state.car;
      if (car == null) {
        emit(const CarErrorState());
        return;
      }
      if (documentData?.isNotEmpty ?? false) {
        final String documentName = documentData?['name'];
        final String documentType = documentData?['type'];
        if (car.documentList?.isEmpty ?? true) {
          switch (documentType) {
            case 'General documents':
              car.documentList?[0] = <Document>[
                Document(
                  id: 1,
                  name: documentName,
                )
              ];
              break;
            case 'Invoices':
              car.documentList?[1] = <Document>[
                Document(
                  id: 1,
                  name: documentName,
                )
              ];
              break;
            case 'Other documents':
              car.documentList?[2] = <Document>[
                Document(
                  id: 1,
                  name: documentName,
                )
              ];
              break;
            default:
              car.documentList?[0] = <Document>[
                Document(
                  id: 1,
                  name: documentName,
                )
              ];
              break;
          }
        } else {
          switch (documentType) {
            case 'General documents':
              car.documentList?[0].add(
                Document(
                  id: 1,
                  name: documentName,
                ),
              );
              break;
            case 'Invoices':
              car.documentList?[1].add(
                Document(
                  id: 1,
                  name: documentName,
                ),
              );
              break;
            case 'Other documents':
              car.documentList?[2].add(
                Document(
                  id: 1,
                  name: documentName,
                ),
              );
              break;
            default:
              car.documentList?[0].add(
                Document(
                  id: 1,
                  name: documentName,
                ),
              );
              break;
          }
        }
        log.info(
          '''Saving document $documentName of type 
            $documentType to car ${car.name}''',
        );
        await app<CarService>().saveCar(car: car);
        emit((state as CarDocumentLoadedState).copyWith(car: car));
      }
    }
  }
}
