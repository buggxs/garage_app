import 'package:garage_app/core/i18n/delegates/i18n.dart';

part 'common_i18n_de.dart';
part 'common_i18n_en.dart';

enum CommonText {
  update,
  back,
  next,
  save,
  selectImage,
}

class CommonI18n extends I18n<CommonText> {
  CommonI18n(String languageCode)
      : super(
          languageCode: languageCode,
          values: <String, Map<CommonText, String>>{
            'en': _enValues,
            'de': _deValues,
          },
        );
}
