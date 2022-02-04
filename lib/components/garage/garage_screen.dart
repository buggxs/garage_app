import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_divider.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';

import 'bloc/garage_bloc.dart';


class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', ''];

  @override
  Widget build(BuildContext context) {

    GarageBloc bloc = context.watch<GarageBloc>();
    GarageState state = bloc.state;

    Widget? child;

    if(state is GarageLoadedState) {
      child = _carList(state.cars);
    }


    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: child,
      ),
      floatingActionButton: floatingParkingButton(context),
    );
  }

  Widget floatingParkingButton(BuildContext context) {
    return InkWell(
      onTap: () {
        GarageBloc.of(context).add(GarageParkingCarEvent());
      },
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(
              color: Colors.blueAccent,
              width: 2.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                  color: Colors.white,
                  width: 5.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
            child: Text(
              "P",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _carList(List<Car> carList) {
    return ListView.builder(
      itemCount: carList.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        if (carList[itemIndex] == null) {
          return const CarListItemEmpty();
        }
        return CarListItem(car: carList[itemIndex], index: itemIndex,);
      },
    );
  }

}
