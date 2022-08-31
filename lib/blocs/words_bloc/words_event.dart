part of 'words_bloc.dart';

abstract class WordsEvent extends Equatable {
  const WordsEvent();
}

class WordSearchEvent extends WordsEvent{
  final String keyword; 
  const WordSearchEvent(this.keyword);

  @override
  List<Object> get props => [];
}
class LoadedWordEvent extends WordsEvent {
  @override
  List<Object> get props => [];
}

class LoadedSearchWordEvent extends WordsEvent {
  @override
  List<Object> get props => [];
}
