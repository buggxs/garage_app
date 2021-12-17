import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.read<AppCubit>().showGarageScreen(1),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("MyCar"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Icon(Icons.edit),
              onTap: () => print("Nöö"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 270,
                child: FittedBox(
                  child: Image(
                    image: AssetImage('assets/img/bmw.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("TÜV bis: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("08.2022")
                        ]
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Baujahr: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("2013")
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            oilCard(context),
            oilCard(context),
            oilCard(context),
            oilCard(context),
            technicalCard(context),
          ],
        )
      ),
    );
  }



  Widget oilCard(BuildContext context) {
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
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/car-oil.png"), size: 20.0,),
                  ),
                  Text(
                    AppLocalizations.of(context)!.oil_card_heading,
                    style: TextStyle(
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
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("100.00 km /"),
                      Text("08.12.2021"),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("160.000 km oder"),
                      Text("08.12.2022"),
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


  Widget technicalCard(BuildContext context) {
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
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/car-oil.png"), size: 20.0,),
                  ),
                  Text(
                    AppLocalizations.of(context)!.technical_card_heading,
                    style: TextStyle(
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
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("100.00 km /"),
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("100.00 km /"),
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("100.00 km /"),
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.last_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("100.00 km /"),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("08.12.2022"),
                      SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("08.12.2022"),
                      SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("08.12.2022"),
                      SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context)!.next_change,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("08.12.2022"),
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
