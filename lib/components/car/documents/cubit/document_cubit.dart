import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
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

  CarCubit carCubit;
  Car? car;

  void loadDocuments() {
    emit(DocumentLoadingState());

    emit(DocumentLoadedState(
      documentList: car?.documentList ?? [[]],
    ));
  }
}
