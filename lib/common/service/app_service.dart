
import 'package:garage_app/common/service/popup_service.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

void setup() {
  app.registerSingleton<PopupService>(PopupService());
}