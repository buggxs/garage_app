import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/auth_credentials.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';
import 'package:meta/meta.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit({
    required this.authRepository,
  }) : super(Authenticated(user: 'Demo')) {
    attemptAutoLogin();
  }

  final AuthRepository authRepository;

  void attemptAutoLogin() async {
    try {
      final userId = await authRepository.attemptAutoLogin();
      // final user = dataRepo.getUser(userId);
      final user = userId;
      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials authCredentials) {
    // final user = dataRepo.getUser(authCredentials.userId);
    final user = authCredentials.userId;
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepository.signOut();
    emit(Unauthenticated());
  }
}
