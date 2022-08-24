part of 'words_bloc.dart';

abstract class WordsEvent extends Equatable {
  const WordsEvent();
}

class LoadedWordEvent extends WordsEvent {
  @override
  List<Object> get props => [];
}

class LoadedSearchWordEvent extends WordsEvent {
  @override
  List<Object> get props => [];
}
