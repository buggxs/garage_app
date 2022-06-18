import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:meta/meta.dart';

part 'document_state.dart';

// TODO: Change state to CarState
class DocumentCubit extends Cubit<DocumentState> with LoggerMixin {
  DocumentCubit({
    required this.car,
    required this.carCubit,
  }) : super(DocumentLoadingState());

  Car car;
  CarCubit carCubit;

  void loadDocuments() async {
    emit(DocumentLoadingState());

    List<List<Document>> documents =
        car.documentList ?? <List<Document>>[[], [], []];

    log.info('Loaded documents of car: ${car.name} (ID: ${car.id})');

    emit(DocumentLoadedState(documentList: documents));
    carCubit.updateTab(1);
  }
}
