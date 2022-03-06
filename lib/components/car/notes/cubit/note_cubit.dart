import 'package:bloc/bloc.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void loadNotes() {
    emit(NoteLoading());

    final List<Note> noteList = <Note>[
      Note(
        id: 1,
        note:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
        dateTime: DateTime(2022, 2, 20),
      ),
      Note(
        id: 2,
        note:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
        dateTime: DateTime.now(),
      ),
    ];

    noteList.sort((Note a, Note b) => b.dateTime!.compareTo(a.dateTime!));
    emit(NoteLoaded(noteList: noteList));
  }
}
