import 'package:garage_app/api/car/car_local_service.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/document/document_service.dart';
import 'package:garage_app/common/widgets/modal_service.dart';
import 'package:garage_app/common/widgets/popup_service.dart';
import 'package:garage_app/core/i18n/delegates/i18n.dart';
import 'package:get_it/get_it.dart';

/// [GetIt] is a simple service locator for accessing services from anywhere
/// in the app.
final GetIt app = GetIt.instance;

void setup() {
  app
    ..registerLazySingleton<PopupService>(() => PopupService())
    ..registerLazySingleton<ModalService>(() => ModalService())
    ..registerLazySingleton<CarService>(() => LocalCarService())
    ..registerFactory<DocumentService>(() => LocalDocumentService())
    ..registerSingleton<LocaleInformation>(LocaleInformation())
    ..registerSingleton<LocalCarRepository>(LocalCarRepository());
}
