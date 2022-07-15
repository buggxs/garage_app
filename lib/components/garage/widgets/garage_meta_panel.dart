import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/misc/color_constants.dart';

class GarageMetaPanel extends StatelessWidget {
  const GarageMetaPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4.0,
          ),
        ),
        color: ColorConstants.shieldBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabeledText(
                    caption: 'Fahrzeuge / Parkplätze',
                    text: '0 / 2',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                  LabeledText(
                    caption: 'Vorhandene Marken',
                    text: 'VW, Audi',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  LabeledText(
                    caption: 'Autos mit Warnungen',
                    text: 'Gigolo - Audi A3, Sweety - Golf 4',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
