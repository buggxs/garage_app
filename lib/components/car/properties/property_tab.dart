import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/car/properties/bloc/car_property_cubit.dart';
import 'package:garage_app/components/car/properties/widget/property_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/utils/text_formatter.dart';

class PropertyTab extends StatelessWidget {
  const PropertyTab({required this.car, Key? key}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CarPropertyCubit(car),
      child: const PropertyTabContent()
    );
  }
}


class PropertyTabContent extends StatelessWidget {
  const PropertyTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> imageList = [
      'assets/img/bmw.jpeg',
      'assets/img/bmw2.jpeg',
      'assets/img/bmw3.jpg',
    ];

    CarPropertyCubit cubit = context.watch<CarPropertyCubit>();
    CarPropertyState state = cubit.state;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
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
                infoCard(
                  context,
                  "TÜV bis: ",
                  TextFormatter
                    .formatDateToMonthAndYear(cubit.car.date)
                ),
                infoCard(
                  context,
                  "Kilometerstand: ",
                  "145.000"
                ),
                infoCard(
                  context,
                  "Baujahr: ",
                  "2013"
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 5.0, top: 16.0),
            child: Text(
              "Daten zu deinem Auto",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
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
            type: 'warning',
          ),
          PropertyCard(
            property: 'timing_belt',
            type: 'success',
          ),
          technicalCard(context),
        ],
      )
    );
  }


  Widget infoCard(BuildContext context, String caption, String content) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Text>[
              Text(
                caption,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                  content,
                  style: const TextStyle(fontWeight: FontWeight.bold)
              )
            ]
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
