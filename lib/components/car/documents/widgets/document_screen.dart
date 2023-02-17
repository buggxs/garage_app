import 'package:flutter/material.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/common/theme/custom_ligth_theme.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({
    Key? key,
    this.document,
  }) : super(key: key);

  final Document? document;

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  CarText.uploadDocument(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                CustomLightTheme.myGarageBlue,
                              ),
                            ),
                    onPressed: () async {},
                    child: Text(
                      CarText.upload(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
