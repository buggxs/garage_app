import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.sessionCubit}) : super(DashboardScreenState(0));

  final SessionCubit sessionCubit;

  void showGarageScreen(int index) => emit(MyGarageScreenState(index));

  void showDashboardScreen(int index) => emit(DashboardScreenState(index));

  void showSettingsScreen(int index) => emit(SettingsScreenState(index));

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
