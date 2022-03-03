import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/core/app_localizations.dart';

class TechnicalCard extends StatelessWidget {
  const TechnicalCard({
    Key? key,
    required this.technicalData,
  }) : super(key: key);

  final TechnicalData? technicalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ImageIcon(
                      AssetImage("assets/icons/settings-gears.png"),
                      size: 22.0,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .translate('technical_card_heading')!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LabeledText(
                            caption: AppLocalizations.of(context)!
                                .translate('brand')!,
                            text: '${technicalData?.brand}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption: AppLocalizations.of(context)!
                                .translate('model')!,
                            text: '${technicalData?.model}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption: AppLocalizations.of(context)!
                                .translate('type')!,
                            text: '${technicalData?.type}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LabeledText(
                            caption:
                                AppLocalizations.of(context)!.translate('hsn')!,
                            text: '${technicalData?.hsn}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption:
                                AppLocalizations.of(context)!.translate('tsn')!,
                            text: '${technicalData?.tsn}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
