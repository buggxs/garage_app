import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';
import 'package:cache_image/cache_image.dart';

class CarListItem extends StatelessWidget {

  const CarListItem({
    Key? key,
    dynamic car
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
      child: Card(
        color: Colors.grey[400],
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => BlocProvider.of<AppCubit>(context).showCarScreen(index: 1, carId: 1),
          onLongPress: () {
            print("Long press CarCard");
          },
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
    );
  }

  Widget carImage() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const CircleAvatar(
        radius: 40,
        backgroundImage: Image(
          image: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/placeholder.png'),
            image: CacheImage('gs://your-project.appspot.com/image.jpg'),
          ),
        )
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

}
