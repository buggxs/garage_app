import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/common/service/modal_service.dart';
import 'package:garage_app/common/widgets/icon_text.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';
import 'package:cache_image/cache_image.dart';

import 'car_list_item_divider.dart';

class CarListItem extends StatelessWidget {

  const CarListItem({
    Key? key,
    this.car,
    required this.index,
    this.onLongPress,
  }) : super(key: key);

  final Function? onLongPress;
  final int index;
  final Car? car;



  @override
  Widget build(BuildContext context) {

    return car != null ? Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
          child: Card(
            color: Colors.grey[400],
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () => BlocProvider.of<AppCubit>(context)
                  .showCarScreen(index: index, car: car!),
              onLongPress: () => app<ModalService>().showUpdateModal(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _carImage(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _carHeading(car!),
                        _carProperties(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const CarListItemDivider(),
      ],
    ) : const SizedBox(height: 10,);
  }

  Widget _carImage() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: SizedBox(
          height: 100,
          width: 100,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/img/car-placeholder.png'),
            image: CacheImage('https://www.bmw.de/content/dam/bmw/marketDE/bmw_de/navigation/2102_BMW8xADxVogue_01-022%2016-bit%20SP-885_890x500.jpg'),
          ),
        ),
      ),
    );
  }

  Widget _carHeading(Car car) {
    return Container(
      child: Text('${car.name} - ${car.technicalData?.brand} ${car.technicalData?.model}', style: const TextStyle(fontSize: 18),),
      padding: const EdgeInsets.all(8.0),
    );
  }

  Widget _carProperties(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                text: AppLocalizations.of(context)!.air_conditioner,
                iconData: Icons.ac_unit,
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(height: 5,),
              IconText(
                text: AppLocalizations.of(context)!.oil,
                assetImage: const AssetImage("assets/icons/car-oil.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                text: AppLocalizations.of(context)!.brake,
                assetImage: const AssetImage("assets/icons/brake.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(height: 5,),
              IconText(
                text: AppLocalizations.of(context)!.timing_belt,
                assetImage: const AssetImage("assets/icons/timing-belt.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
