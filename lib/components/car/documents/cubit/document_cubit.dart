import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:meta/meta.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit({
    this.car,
  }) : super(DocumentLoadingState());

  Car? car;

  void saveDocument(Document document) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      print(file);
    } else {
      // User canceled the picker
    }
  }

  void loadDocuments() {
    emit(DocumentLoadingState());

    emit(DocumentLoadedState(
      documentList: car?.documentList ?? [[]],
    ));
  }
}
