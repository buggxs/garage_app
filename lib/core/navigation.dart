
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/garage/bloc/garage_bloc.dart';
import 'package:garage_app/components/garage/garage_screen.dart';

class AppNavigator {

  final GarageBloc _garageBloc = GarageBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _garageBloc,
            child: GarageScreen(),
          )
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _garageBloc,
              child: GarageScreen(),
            )
        );
        break;
    }
  }

}