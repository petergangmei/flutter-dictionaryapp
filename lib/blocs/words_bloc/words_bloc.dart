import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';
import 'package:ruangmei_dictionary/data/reponsitory.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final WordRepository _wordRepository;

  WordsBloc(this._wordRepository) : super(WordsLoadingState()) {
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
