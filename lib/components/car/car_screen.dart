import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/car/widget/property_card.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/img/bmw.jpeg',
      'assets/img/bmw2.jpeg',
      'assets/img/bmw3.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.read<AppCubit>().showGarageScreen(1),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("MyCar"),
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
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: imageList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image(
                              image: AssetImage(imageUrl),
                              width: 1050,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ]
                        ),
                      );
                    },
                  );
                }).toList(),
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
                        children: const <Text>[
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
                          children: const <Text>[
                            Text("Kilometerstand: ", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("145.000")
                          ]
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const <Text>[
                          Text("Baujahr: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("2013")
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            PropertyCard(
              property: 'oil',
              type: 'success',
            ),
            PropertyCard(
              property: 'air_conditioner',
              type: 'success',
            ),
            PropertyCard(
              property: 'brake',
              type: 'success',
            ),
            PropertyCard(
              property: 'timing_belt',
              type: 'success',
            ),
            technicalCard(context),
          ],
        )
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
