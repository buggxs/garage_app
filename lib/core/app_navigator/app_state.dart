part of 'app_cubit.dart';

@immutable
abstract class AppState {
  AppState(this.bottomNavigationIndex);

  int bottomNavigationIndex;
}

class MyGarageScreenState extends AppState {
  MyGarageScreenState(this.bottomNavigationIndex) : super(bottomNavigationIndex);

  int bottomNavigationIndex;
}

class DashboardScreenState extends AppState {
  DashboardScreenState(this.bottomNavigationIndex) : super(bottomNavigationIndex);

  int bottomNavigationIndex;
}

class SettingsScreenState extends AppState {
  SettingsScreenState(this.bottomNavigationIndex) : super(bottomNavigationIndex);

  int bottomNavigationIndex;
}