import 'dart:developer';
import 'dart:io';

import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:path_provider/path_provider.dart';

abstract class DocumentService {
  Future<void> saveDocument({
    required Car car,
    required File file,
  });

  Future<List<Document>> loadDocuments({
    Car? car,
  });
}

class LocalDocumentService implements DocumentService {
  @override
  Future<List<Document>> loadDocuments({Car? car}) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    throw UnimplementedError();
  }

  @override
  Future<void> saveDocument({
    Car? car,
    required File file,
  }) async {
    if (car != null) {
      final Directory carDocDir = Directory('${car.id}_documents');
      if (!await carDocDir.exists()) {
        await carDocDir.create();
      }
      // final int nextIndex = car.documentList?.length ?? 0;
      final String name = '${car.name}_fahrzeugschein';
      await file.rename(name);
      log(file.path);
      //await file.copy('${carDocDir.path}');
      //Document doc = Document(id: nextIndex, path: );
      //String appDocPath = carDocDir.path;
    }
  }
}
