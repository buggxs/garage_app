import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/common/service/modal_service.dart';
import 'package:garage_app/common/widgets/labled_text.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/car/properties/bloc/car_property_cubit.dart';
import 'package:garage_app/components/car/properties/details/property_details_screen.dart';
import 'package:garage_app/components/car/properties/widget/property_card.dart';
import 'package:garage_app/components/car/properties/widget/technical_card.dart';
import 'package:garage_app/core/utils/number_formatter.dart';
import 'package:garage_app/core/utils/text_formatter.dart';

enum CarProperty {
  oil,
  airConditioner,
  brake,
  timingBelt,
}

class PropertyTab extends StatelessWidget {
  const PropertyTab({required this.car, Key? key}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CarPropertyCubit(
        car: car,
      ),
      child: const PropertyTabContent(),
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
    Car _car = cubit.state.car;

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
                        child: Stack(fit: StackFit.expand, children: [
                          Image(
                            image: AssetImage(imageUrl),
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ]),
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
                  infoCard(context, "TÜV bis: ",
                      TextFormatter.formatDateToMonthAndYear(_car.date)),
                  infoCard(context, "Kilometerstand: ",
                      NumberFormatter.mileageFormatter(_car.mileage)),
                  infoCard(context, "Baujahr: ", _car.vintage.toString()),
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
                    fontWeight: FontWeight.bold),
              ),
            ),
            PropertyCard(
              _car.oilData,
              type: _car.calculateCarType(_car.oilData),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDetailsScreen(),
                ),
              ),
              onLongPress: () => app<ModalService>().showPropertyUpdateModal(
                context: context,
                type: _car.calculateCarType(_car.oilData),
                data: _car.oilData,
                onUpdate: cubit.updateCarProperty,
              ),
            ),
            PropertyCard(
              _car.airConditioner,
              type: _car.calculateCarType(_car.airConditioner),
            ),
            PropertyCard(
              _car.brakeData,
              type: _car.calculateCarType(_car.brakeData),
            ),
            PropertyCard(
              _car.timingBeltData,
              type: _car.calculateCarType(_car.brakeData),
            ),
            TechnicalCard(
              technicalData: _car.technicalData,
            ),
          ],
        ));
  }

  Widget infoCard(BuildContext context, String caption, String content) {
    return Card(
      color: Colors.white,
      child: LabeledText(
        caption: caption,
        text: content,
      ),
    );
  }
}
