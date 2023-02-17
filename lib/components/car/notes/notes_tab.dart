import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/components/car/notes/cubit/note_cubit.dart';
import 'package:garage_app/components/car/notes/widgets/note_card.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({
    Key? key,
    this.car,
  }) : super(key: key);

  final Car? car;

  @override
  Widget build(BuildContext context) {
    final CarCubit carCubit = context.watch<CarCubit>();

    return BlocProvider<NoteCubit>(
      create: (BuildContext context) => NoteCubit(
        car: carCubit.car,
        carCubit: carCubit,
      )..loadNotes(),
      child: const NoteTabContent(),
    );
  }
}

class NoteTabContent extends StatelessWidget {
  const NoteTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteCubit cubit = context.watch<NoteCubit>();
    final NoteState state = cubit.state;

    Widget? child;

    if (state is NoteLoaded) {
      child = _buildList(state.noteList);
    } else if (state is NoteLoading) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is NoteError) {
      child = Center(
        child: Text(state.message),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }

  Widget _buildList(List<Note> noteList) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return NoteCard(
          note: noteList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 8),
      itemCount: noteList.length,
    );
  }
}
