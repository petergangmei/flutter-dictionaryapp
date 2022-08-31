// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';
import 'package:ruangmei_dictionary/data/reponsitory.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final WordRepository _wordRepository;

  WordsBloc(this._wordRepository) : super(WordsLoadingState()) {
    on<WordSearchEvent>(((event, emit) async {
      // ignore: prefer_is_empty
      if (event.keyword.length <= 0) {
        emit(WordsLoadingState());
        try {
          final words = await _wordRepository.getWords();
          emit(WordsLoadedState(words));
        } catch (e) {
          emit(WordsLoadedErrorState(e.toString()));
        }
      } else {
        emit(WordsLoadingState());
        print(event.keyword);
        try {
          print('word loaded');
          final words = await _wordRepository.wordSearch(event.keyword);
          emit(WordsLoadedState(words));
        } catch (e) {
          print('word loading error');
          emit(WordsLoadedErrorState(e.toString()));
        }
      }
    }));

    on<LoadedWordEvent>((event, emit) async {
      emit(WordsLoadingState());
      try {
        final words = await _wordRepository.getWords();
        emit(WordsLoadedState(words));
      } catch (e) {
        emit(WordsLoadedErrorState(e.toString()));
      }
    });

  }
}
