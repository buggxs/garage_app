import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              if (state is MyGarageScreenState)
                MaterialPage(
                  child: GarageScreen(),
                ),

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
}
