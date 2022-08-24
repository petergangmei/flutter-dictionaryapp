part of 'counters_bloc.dart';

abstract class CountersState extends Equatable {
  const CountersState();
  
  @override
  List<Object> get props => [];
}

class CountersInitial extends CountersState {}

class CountersClickState extends CountersState{

}
