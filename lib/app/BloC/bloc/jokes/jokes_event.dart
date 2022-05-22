part of 'jokes_bloc.dart';

abstract class JokesEvent extends Equatable {
  const JokesEvent();
}


class FetchJokes extends JokesEvent{
  @override
  List<Object?> get props => [];

}
