

part of 'todo_bloc.dart';




abstract class TodoEvent extends Equatable {
  const TodoEvent();
}


class AddTodo extends TodoEvent{
  final TodoModel todo;

  const AddTodo({ required this.todo});

  @override
  List<Object?> get props => [todo];
}

class RemoveTodo extends TodoEvent{
  final int index;

 const RemoveTodo(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateTodo extends TodoEvent{
  final TodoModel todo;
  final int index;
  const UpdateTodo(this.todo,this.index);
  @override
  List<Object?> get props => [todo, index];
}

class LoadTodo extends TodoEvent{
  @override
  List<Object?> get props => [];
}

class TodoLoadCompleted extends TodoEvent{
  @override
  List<Object?> get props => [];
}

class ClearTodo extends TodoEvent{
  @override
  List<Object?> get props => [];
}







