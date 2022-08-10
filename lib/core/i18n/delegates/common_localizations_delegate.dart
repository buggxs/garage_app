import 'package:flutter/cupertino.dart';

abstract class CommonLocalizationDelegate<T> extends LocalizationsDelegate<T> {
  const CommonLocalizationDelegate();

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;

  @override
  Future<T> load(Locale locale);

  @override
  bool isSupported(Locale locale) {
    return <String>['en', 'de'].contains(locale.languageCode);
  }
}
