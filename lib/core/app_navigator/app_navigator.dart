import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/dashboard/dashboard_screen.dart';
import 'package:garage_app/components/garage/garage_screen.dart';
import 'package:garage_app/components/settings/settings_screen.dart';

import 'app_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Navigator(
            pages: [

              // show Garage Screen
              ...addGarageViews(context, state),

              if (state is DashboardScreenState)
                const MaterialPage(
                  child: DashboardScreen()
                ),

              if (state is SettingsScreenState)
                const MaterialPage(
                    child: SettingsScreen()
                ),

            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        }
    );
  }

  List<MaterialPage> addGarageViews(context, state) {
    List<MaterialPage> garageViews = [
      if (state is MyGarageScreenState)
        MaterialPage(
          child: GarageScreen(),
        )
    ];

    if (state is MyCarDetailsState) {
      if (state.carId != null) {
        garageViews.add(
          const MaterialPage(
            child: CarScreen()
          )
        );
      }
    }

    return garageViews;
  }
}
