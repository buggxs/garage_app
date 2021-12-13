part of 'confirmation_bloc.dart';

class ConfirmationState {

  final String username;
  bool get isValidUsername => username.length > 3;

  final String code;
  bool get isValidCode => code.length < 6;

  final FormSubmissionStatus formStatus;

  ConfirmationState({
    this.username = '',
    this.code = '',
    this.formStatus = const InitialFormStatus(),
  });


  ConfirmationState copyWith({
    String? username,
    String? code,
    FormSubmissionStatus? formStatus,
  }) {
    return ConfirmationState(
      username: username ?? this.username,
      code: code ?? this.code,
      formStatus: formStatus ?? this.formStatus,
    );
  }


}


