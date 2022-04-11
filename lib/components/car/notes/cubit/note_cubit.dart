import 'package:bloc/bloc.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({
    required this.carCubit,
    this.car,
  }) : super(NoteLoading()) {
    carCubit.stream.listen((carState) {
      if (carState is CarLoadedState) {
        loadNotes();
      }
    });
  }

  final Logger _log = Logger('NoteCubit');

  CarCubit carCubit;
  Car? car;

  void loadNotes() async {
    emit(NoteLoading());

    if (car == null) {
      _log.warning('Car is null');
      emit(NoteError(message: "Car konnte nicht geladen werden"));
    }

    Car? _car = await app<LocalCarService>().getCarById(carId: car!.id);

    List<Note> carNoteList = _car?.noteList ?? <Note>[];

    _log.info('Loaded ${carNoteList.length} notes');

    carNoteList.sort((Note a, Note b) => b.dateTime!.compareTo(a.dateTime!));
    emit(NoteLoaded(noteList: carNoteList));
  }
}
