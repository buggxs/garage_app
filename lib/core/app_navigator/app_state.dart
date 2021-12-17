part of 'app_cubit.dart';

@immutable
abstract class AppState {
  const AppState({this.bottomNavigationIndex});

  final int? bottomNavigationIndex;
}

class MyGarageScreenState extends AppState {
  const MyGarageScreenState({
    int? bottomNavigationIndex
  }) : super(bottomNavigationIndex: bottomNavigationIndex);

}

class DashboardScreenState extends AppState {
  const DashboardScreenState({
    int? bottomNavigationIndex
  }) : super(bottomNavigationIndex: bottomNavigationIndex);

}

class SettingsScreenState extends AppState {
  const SettingsScreenState({
    int? bottomNavigationIndex
  }) : super(bottomNavigationIndex: bottomNavigationIndex);

}

class MyCarDetailsState extends AppState {
  const MyCarDetailsState({
    int? bottomNavigationIndex,
    this.carId
  }) : super(bottomNavigationIndex: bottomNavigationIndex);

  final int? carId;
}