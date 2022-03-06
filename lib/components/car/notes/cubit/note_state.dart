part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  NoteLoaded({
    this.noteList = const <Note>[],
  });

  final List<Note> noteList;
}

class NoteErrorState extends NoteState {
  NoteErrorState({
    required this.message,
  });

  final String message;
}
