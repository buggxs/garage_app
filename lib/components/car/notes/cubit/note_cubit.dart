import 'package:bloc/bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> with LoggerMixin {
  NoteCubit({
    required this.car,
    required this.carCubit,
  }) : super(NoteLoading());

  Car car;
  CarCubit carCubit;

  void loadNotes() async {
    emit(NoteLoading());

    List<Note> carNoteList = car.noteList ?? <Note>[];

    log.info('Loaded ${carNoteList.length} notes');

    carNoteList.sort((Note a, Note b) => b.dateTime!.compareTo(a.dateTime!));
    emit(NoteLoaded(noteList: carNoteList));

    carCubit.updateTab(2);
  }
}
