import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/auth_credentials.dart';
import 'package:garage_app/components/authentication/auth_cubit.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';
import 'package:meta/meta.dart';
import '../../form_submission_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(LoginState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is LoginSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepository.login(
          username: state.username,
          password: state.password,
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.launchSession(AuthCredentials(
          username: state.username,
          userId: userId,
        ));
      } catch (e) {
        Exception exception = e as Exception;
        yield state.copyWith(formStatus: SubmissionFailed(exception));
      }



    }

  }
}
