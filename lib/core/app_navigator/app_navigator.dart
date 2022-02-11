import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/car/bloc/car_bloc.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/garage/bloc/garage_bloc.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

import 'app_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Navigator(
        pages: [
          // show Garage Screen
          ...addGarageViews(context, state),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }

  List<MaterialPage> addGarageViews(context, state) {
    List<MaterialPage> garageViews = [
      if (state is MyGarageScreenState)
        MaterialPage(
          child: BlocProvider(
            create: (BuildContext context) =>
                GarageBloc()..add(const GarageLoadingParkedCars()),
            child: GarageScreen(),
          ),
        ),
      if (state is MyCarDetailsState)
        MaterialPage(
          child: BlocProvider(
            create: (BuildContext context) => CarBloc(car: state.car),
            child: const CarScreen(),
          ),
        ),
    ];

    return garageViews;
  }
}
