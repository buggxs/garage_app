part of 'confirmation_bloc.dart';

@immutable
abstract class ConfirmationEvent {}


class ConfirmationCodeChanged extends ConfirmationEvent {
  final String code;

  ConfirmationCodeChanged({required this.code});
}


class ConfirmationSubmitted extends ConfirmationEvent {}