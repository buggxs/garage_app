import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required this.sessionCubit
  }) : super(const DashboardScreenState(bottomNavigationIndex: 0));

  final SessionCubit sessionCubit;

  void showGarageScreen(int index) =>
      emit(MyGarageScreenState(bottomNavigationIndex: index));

  void showDashboardScreen(int index) =>
      emit(DashboardScreenState(bottomNavigationIndex: index));

  void showSettingsScreen(int index) =>
      emit(SettingsScreenState(bottomNavigationIndex: index));

  void showCarScreen(int index, int carId) =>
      emit(MyCarDetailsState(bottomNavigationIndex: index, carId: carId));

  void navigateTo(int index) {
    switch(index) {
      case 0:
        showDashboardScreen(index);
        break;
      case 1:
        showGarageScreen(index);
        break;
      case 2:
        showSettingsScreen(index);
        break;
      default:
        showDashboardScreen(index);
        break;
    }
  }
}
