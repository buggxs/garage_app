import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/car/model/technical_data.dart';

class TechnicalCard extends StatelessWidget {
  const TechnicalCard({
    Key? key,
    required this.technicalData
  }) : super(key: key);

  final TechnicalData? technicalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/settings-gears.png"), size: 20.0,),
                  ),
                  Text(
                    AppLocalizations.of(context)!.technical_card_heading,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        '${technicalData?.model}',
                        style: const TextStyle(fontWeight: FontWeight.w500)
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("100.00 km /"),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("100.00 km /"),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("100.00 km /"),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("08.12.2022"),
                      const SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("08.12.2022"),
                      const SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("08.12.2022"),
                      const SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("08.12.2022"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
