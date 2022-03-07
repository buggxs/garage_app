part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  NoteLoaded({
    this.noteList = const <Note>[],
  });

  final List<Note> noteList;
}

class NoteError extends NoteState {
  NoteError({
    required this.message,
  });

  final String message;
}
