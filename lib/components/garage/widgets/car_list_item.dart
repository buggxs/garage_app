import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/components/garage/widgets/car_data_input.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';
import 'package:cache_image/cache_image.dart';

import 'car_list_item_divider.dart';

class CarListItem extends StatelessWidget {

  Function? onLongPress;

  CarListItem({
    Key? key,
    dynamic car,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
          child: Card(
            color: Colors.grey[400],
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () => BlocProvider.of<AppCubit>(context).showCarScreen(index: 1, carId: 1),
              onLongPress: () => _showUpdateModal(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  carImage(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        carHeading(),
                        carProperties(context),
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
    );
  }

  Widget carImage() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: Container(
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

  Widget carHeading() {
    return Container(
      child: Text("Mein cooles Auto dot com", style: TextStyle(fontSize: 18),),
      padding: EdgeInsets.all(8.0),
    );
  }

  Widget carProperties(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.ac_unit, color: Colors.green[800], size: 20.0,),
                  ),
                  Text(AppLocalizations.of(context)!.air_conditioner)
                ],
              ),
              const SizedBox(height: 5,),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/car-oil.png"), color: Colors.green[800], size: 20.0,),
                  ),
                  Text(AppLocalizations.of(context)!.oil)
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/brake.png"), color: Colors.green[800], size: 20.0,),
                  ),
                  Text(AppLocalizations.of(context)!.brake)
                ],
              ),
              const SizedBox(height: 5,),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: ImageIcon(AssetImage("assets/icons/timing-belt.png"), color: Colors.green[800], size: 20.0,),
                  ),
                  Text(AppLocalizations.of(context)!.timing_belt)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  _showUpdateModal(
      BuildContext context
      ) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Mein cooles Auto dot com",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          CarDataInput(
                            hintText: 'Aktueller Kilometerstand',
                            buttonText: 'Speichern',
                            textInputType: TextInputType.number,
                          ),
                          CarDataInput(
                            hintText: 'TÜV',
                            buttonText: 'Aktualisieren',
                            textInputType: TextInputType.datetime,
                            readOnly: true,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.blueGrey.shade900
                                ),
                            ),
                            onPressed: () => {},
                            child: Text("Aktualisieren")
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
