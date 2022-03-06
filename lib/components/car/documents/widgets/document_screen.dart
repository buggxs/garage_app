import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/core/app_localizations.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => print('test'),
                    child: Text(
                        AppLocalizations.of(context)!.translate('upload')!),
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
