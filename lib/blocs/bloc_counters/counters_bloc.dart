import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counters_event.dart';
part 'counters_state.dart';


class CountersBloc extends Bloc<CountersState, CountersState> {
  CountersBloc() : super(CountersInitial()) {
    on<CountersState>((event, emit) {

    });
     on<CountersClickState>((event, emit) {
      emit(CountersClickState());
    });
  }
}
