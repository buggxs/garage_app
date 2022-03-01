import 'package:bloc/bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.sessionCubit}) : super(const MyGarageScreenState());

  final SessionCubit sessionCubit;

  void showGarageScreen(int index) =>
      emit(MyGarageScreenState(bottomNavigationIndex: index));

  void showDashboardScreen(int index) =>
      emit(DashboardScreenState(bottomNavigationIndex: index));

  void showSettingsScreen(int index) =>
      emit(SettingsScreenState(bottomNavigationIndex: index));

  void showCarScreen({required Car car}) => emit(MyCarDetailsState(car: car));

  void navigateTo(int index) {
    switch (index) {
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
