import 'package:garage_app/common/i18n/delegates/i18n.dart';

part 'garage_i18n_de.dart';
part 'garage_i18n_en.dart';

enum GarageText {
  hello,
  airConditioner,
  oil,
  brake,
  timingBelt,
}

class GarageI18n extends I18n<GarageText> {
  GarageI18n(String languageCode)
      : super(
          languageCode: languageCode,
          values: <String, Map<GarageText, String>>{
            'en': _enValues,
            'de': _deValues,
          },
        );
}
