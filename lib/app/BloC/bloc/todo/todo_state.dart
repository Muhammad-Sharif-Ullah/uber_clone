part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;
  TodoLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}

class TodoEmpty extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadError extends TodoState {
  @override
  List<Object> get props => [];
}
