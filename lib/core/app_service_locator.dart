import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/document/document_service.dart';
import 'package:garage_app/components/common/widgets/modal_service.dart';
import 'package:garage_app/components/common/widgets/popup_service.dart';
import 'package:get_it/get_it.dart';

final GetIt app = GetIt.instance;

void setup() {
  app
    ..registerLazySingleton<PopupService>(() => PopupService())
    ..registerLazySingleton<ModalService>(() => ModalService())
    ..registerFactory<CarService>(() => LocalCarService())
    ..registerFactory<DocumentService>(() => LocalDocumentService());
}
