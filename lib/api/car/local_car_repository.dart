import 'package:garage_app/api/api.dart';
import 'package:garage_app/core/local_service/local_storage_repository.dart';

class LocalCarRepository extends LocalStorageRepository<Car> {
  @override
  Car castMapToObject(Map<String, dynamic> object) {
    return Car.fromJson(object);
  }

  @override
  String get storageKey => 'car';
}
