part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();
}

class JokesLoading extends JokesState {
  @override
  List<Object> get props => [];
}

class JokeInitial extends JokesState {
  @override
  List<Object> get props => [];
}

class JokesLoaded extends JokesState {
  final JokeModel joke;

  const JokesLoaded({required this.joke});

  @override
  List<Object> get props => [joke];
}

class ErrorToFetch extends JokesState {
  final String error;

  const ErrorToFetch({required this.error});
  @override
  List<Object> get props => [error];
}


