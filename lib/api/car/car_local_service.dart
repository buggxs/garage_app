import 'package:garage_app/api/api.dart';
import 'package:garage_app/core/local_service/local_service.dart';

class LocalCarRepository extends LocalStorageService<Car> {
  @override
  Car castMapToObject(Map<String, dynamic> object) {
    return Car.fromJson(object);
  }

  @override
  String get storageKey => 'car';
}
