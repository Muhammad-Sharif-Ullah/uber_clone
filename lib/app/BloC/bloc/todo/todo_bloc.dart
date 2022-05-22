import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uber_clone/app/data/model/todo_model.dart';
part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> with HydratedMixin{
  final List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;
  final isError = Random().nextBool();
  @override

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is AddTodo) {
        emit(TodoLoading());
        _todos.add(event.todo);
        print.call(state.props);
        emit(TodoLoaded(todos: _todos));
      } else if (event is UpdateTodo) {
        emit(TodoLoading());
        _todos[event.index] = event.todo;
        emit(TodoLoaded(todos: _todos));
      } else if (event is LoadTodo) {
        await Future.delayed(const Duration(seconds: 1));
        // emit(const TodoLoaded(todos: []));
        // print.call(isError);
        // if (isError) {
        //   emit(const TodoLoaded(todos: []));
        // } else {
        //   emit(TodoEmpty());
        // }
      } else if (event is RemoveTodo) {
        emit(TodoLoading());
        _todos.removeAt(event.index);
        if (_todos.isEmpty) {
          emit(TodoEmpty());
        } else {
          emit(TodoLoaded(todos: _todos));
        }
      } else if (event is ClearTodo) {
        _todos.clear();
        emit(TodoEmpty());
      }
    });
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    try{
      final todoAsJson = json['value'] as List;
      List<TodoModel> listOfTodos = todoAsJson.map((todo) => TodoModel.fromJson(todo)).toList();
      return TodoLoaded(todos: listOfTodos);
    } catch(e){

      print.call(e);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    if(state is TodoLoaded){
      return {"value": state.todos};
    }
    return null;
  }


}
