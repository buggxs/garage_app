part of 'document_cubit.dart';

@immutable
abstract class DocumentState extends Equatable {}

class DocumentLoadingState extends DocumentState {
  @override
  List<Object?> get props => <Object?>[];
}

class DocumentLoadedState extends DocumentState {
  DocumentLoadedState({
    this.documentList,
  });

  final List<List<Document>>? documentList;

  @override
  List<Object?> get props => <Object?>[documentList];
}

class DocumentErrorState extends DocumentState {
  DocumentErrorState({this.message});

  final String? message;

  @override
  List<Object?> get props => <Object?>[message];
}
