import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/add_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_automated_screen.dart';
import 'package:garage_app/components/add_vehicle/create_car_manual_screen.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

class AppNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case GarageScreen.route:
        return MaterialPageRoute(
          builder: (_) => const GarageScreen(),
        );
      case CarScreen.route:
        if (args is Car) {
          return MaterialPageRoute(
            builder: (_) => CarScreen(
              car: args,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => GarageScreen(),
        );
      case AddScreen.route:
        return MaterialPageRoute(
          builder: (_) => const AddScreen(),
        );
      case SelectCarScreen.route:
        return MaterialPageRoute(
          builder: (_) => const SelectCarScreen(),
        );
      case CreateCarManualScreen.route:
        return MaterialPageRoute(
          builder: (_) => const CreateCarManualScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
