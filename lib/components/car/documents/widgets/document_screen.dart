import 'package:flutter/material.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/common/widgets/custom_ligth_theme.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/core/app_localizations.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({
    Key? key,
    Document? document,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.translate('upload_document')!,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          CustomLightTheme.myGarageBlue,
                        )),
                    onPressed: () async {},
                    child: Text(
                      AppLocalizations.of(context)!.translate('upload')!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
