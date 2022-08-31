part of 'words_bloc.dart';

abstract class WordsState extends Equatable {
  const WordsState();

  
}

class WordsLoadingState extends WordsState {
  @override
  List<Object> get props => [];
}

class WordsLoadedState extends WordsState {
  const WordsLoadedState(this.words);
  final List<WordModel> words;
  @override
  List<Object> get props => [words];
}

class WordsLoadedErrorState extends WordsState {
  const WordsLoadedErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

