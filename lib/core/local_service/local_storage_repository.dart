import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageRepository<T> {
  LocalStorageRepository();

  /// storage key to find the stored value
  String get storageKey;

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  /// Will return a list of all local saved objects from type [T]
  /// It search for the [storageKey]
  Future<List<T>?> getAll() async {
    final SharedPreferences prefs = await _prefs;
    final String? listString = prefs.getString('${storageKey}_list');
    if (listString?.isEmpty ?? true) {
      return null;
    }
    final List<dynamic> list = jsonDecode(listString!);
    final List<T> localList = list
        .map(
          (dynamic e) => castMapToObject(e as Map<String, dynamic>),
        )
        .toList();
    return Future<List<T>?>.value(localList);
  }

  /// Cast generic to Object
  T castMapToObject(Map<String, dynamic> object);
}
