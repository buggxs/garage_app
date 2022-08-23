import 'package:flutter/material.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/add_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_automated_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_manual_screen.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

class AppNavigator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case GarageScreen.route:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const GarageScreen(),
        );
      case CarScreen.route:
        if (args is Car) {
          return MaterialPageRoute<dynamic>(
            builder: (_) => CarScreen(
              car: args,
            ),
          );
        }
        return MaterialPageRoute<dynamic>(
          builder: (_) => const GarageScreen(),
        );
      case AddScreen.route:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddScreen(),
        );
      case SelectCarScreen.route:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SelectCarScreen(),
        );
      case CreateCarManualScreen.route:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CreateCarManualScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
