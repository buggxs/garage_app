import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:meta/meta.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> with LoggerMixin {
  DocumentCubit({
    required this.carCubit,
    this.car,
  }) : super(DocumentLoadingState()) {
    carCubit.stream.listen((carState) {
      if (carState is CarLoadedState) {
        emit(DocumentLoadingState());
        carCubit.updateTab(1);
        emit(DocumentLoadedState(
          documentList: carState.car.documentList,
        ));
      }
    });
  }

  CarCubit carCubit;
  Car? car;

  void loadDocuments() async {
    emit(DocumentLoadingState());

    if (car == null) {
      emit(DocumentErrorState(message: 'Fehler beim laden des Auto'));
      return;
    }

    Car? _car = await app<CarService>().getCarById(carId: car!.id);

    List<List<Document>> documents =
        _car?.documentList ?? <List<Document>>[[], [], []];

    log.info('Loaded documents of car: ${_car?.name}');

    emit(DocumentLoadedState(documentList: documents));
  }
}
