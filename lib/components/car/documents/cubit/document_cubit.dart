import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit({
    required this.carCubit,
    this.car,
  }) : super(DocumentLoadingState()) {
    carCubit.stream.listen((carState) {
      if (carState is CarLoadedState) {
        emit(DocumentLoadingState());
        emit(
          DocumentLoadedState(documentList: carState.car.documentList),
        );
      }
    });
  }

  final Logger _log = Logger('DocumentCubit');

  CarCubit carCubit;
  Car? car;

  void loadDocuments() async {
    emit(DocumentLoadingState());

    if (car == null) {
      emit(DocumentErrorState(message: 'Fehler beim laden des Auto'));
      return;
    }

    Car _car = await app<LocalCarService>().getCarById(carId: car!.id);

    List<List<Document>> documents =
        _car.documentList ?? <List<Document>>[[], [], []];

    _log.info('Loaded documents of car: ${_car.name}');

    emit(DocumentLoadedState(documentList: documents));
  }
}
