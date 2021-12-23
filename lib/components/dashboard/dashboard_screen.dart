import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dashboardCard(
              heading: AppLocalizations.of(context)!.hello,
              body: Text("Du hast aktuell 2 Fahrzeuge in deiner virtuellen Garage geparkt. "
                  "Du kannst noch 1 weiteres Fahrzeug in der kostenlosen Version parken.",
                style: TextStyle(color: Colors.white),
              )
            ),
            SizedBox(height: 20,),
            dashboardCard(
              heading: "Checks",
              body: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.check, color: Colors.green, size: 20,),
                      ),
                      Text(
                        "Alle Fahrzeuge sind Einsatzbereit",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.warning_amber_outlined, color: Colors.yellow, size: 20,),
                      ),
                      Text(
                        "Es sind noch Rechnungen offen",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              )
            ),
            SizedBox(height: 20,),
            dashboardCard(
                heading: "Aktivitäten",
                body: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ImageIcon(AssetImage("assets/icons/wrench.png"), color: Colors.white, size: 14.0,),
                        ),
                        Text(
                          "Öl bei Fahrzeug 1234 wurde gewechselt",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ImageIcon(AssetImage("assets/icons/wrench.png"), color: Colors.white, size: 14.0,),
                        ),
                        Text(
                          "Zahnriemen bei 1234 gewechselt",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ImageIcon(AssetImage("assets/icons/money.png"), color: Colors.white, size: 14.0,),
                        ),
                        Text(
                          "Rechnung 1234 wurde bezahlt",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget dashboardCard({required String heading, required Widget body}) {
    return Card(
      color: Colors.grey.shade700,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Divider(
              height: 5,
            ),
            Container(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
