import 'package:garage_app/common/i18n/delegates/i18n.dart';

part 'car_i18n_de.dart';
part 'car_i18n_en.dart';

enum CarText {
  parkingSpace,
  documents,
  notes,
  technicalCardHeading,
  brand,
  model,
  type,
  hsn,
  tsn,
  oilCardHeading,
  brakeCardHeading,
  timingBeltCardHeading,
  airConditionerCardHeading,
  lastChange,
  nextChange,
  generalDocumentsHeading,
  invoiceDocumentsHeading,
  otherDocumentsHeading,
  uploadDocument,
  upload,
  errorLoadingDocuments,
  tuevUntil,
  mileage,
  vintage,
}

class CarI18n extends I18n<CarText> {
  CarI18n(String languageCode)
      : super(
          languageCode: languageCode,
          values: <String, Map<CarText, String>>{
            'en': _enValues,
            'de': _deValues,
          },
        );
}
