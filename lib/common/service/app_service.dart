
import 'package:garage_app/common/service/modal_service.dart';
import 'package:garage_app/common/service/popup_service.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

void setup() {
  app.registerSingleton<PopupService>(PopupService());
  app.registerSingleton<ModalService>(ModalService());
}