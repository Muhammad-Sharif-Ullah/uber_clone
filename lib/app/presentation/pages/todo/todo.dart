import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/todo/todo_bloc.dart';
import 'package:uber_clone/app/data/model/todo_model.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme1 =
        Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: Colors.pinkAccent,
        elevation: 5,
      ),
      body: buildTodoBList(textTheme1),
      floatingActionButton: buildFAB(),
    );
  }

  /// If Failed to Load [Todo]
  /// Then don't show Floating Action Button
  BlocBuilder<TodoBloc, TodoState> buildFAB() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadError) {
          return Container();
        }
        return FloatingActionButton(
          onPressed: () => addTodo(context),
          child: const Icon(Icons.add),
          backgroundColor: Colors.pinkAccent,
        );
      },
    );
  }

  /// Show All the todo list
  BlocBuilder<TodoBloc, TodoState> buildTodoBList(TextStyle? textStyle) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoInitial) {
          // return buildLoader();
          return buildEmptyText(textStyle);
        } else if (state is TodoLoaded) {
          return buildTodoListView(context, state.todos);
        }
        // else if (state is TodoLoading) {
        //   context.read<TodoBloc>().add(LoadTodo());
        //   return buildLoader();
        // }
        else if (state is TodoLoadError) {
          return buildFailedText(textStyle);
        } else if (state is TodoEmpty) {
          return buildEmptyText(textStyle);
        }
        return Container();
      },
    );
  }

  /// If no todo on Todo List
  /// show this list
  Center buildEmptyText(TextStyle? textStyle) =>
      Center(child: Text("Add your Todo", style: textStyle));

  Center buildFailedText(TextStyle? textStyle) =>
      Center(child: Text("Failed to load TODO", style: textStyle));

  /// Show Loading when it's
  /// try to load todo form Memory
  Center buildLoader() {
    return const Center(
      child: SizedBox(
        child: FittedBox(child: CupertinoActivityIndicator()),
        height: 100,
        width: 100,
      ),
    );
  }

  /// Todo List Widget
  ListView buildTodoListView(BuildContext context, List<TodoModel> todos) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      itemBuilder: (context, index) {
        final TodoModel todo = todos[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              // height: 100,
              width: double.infinity,
              child: Center(
                child: ListTile(
                  onTap: () => context.read<TodoBloc>().add(RemoveTodo(index)),
                  onLongPress: () => context.read<TodoBloc>().add(ClearTodo()),
                  title: Text(todo.title),
                  trailing: IconButton(
                    onPressed: () {
                      updateTodo(context, index, todo);
                    },
                    icon: const Icon(Icons.update),
                  ),
                  subtitle: Text(todo.subtitle),
                  leading: Icon(todo.isCompleted ? Icons.done : Icons.close),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: todos.length,
      physics: const BouncingScrollPhysics(),
    );
  }

  /// Add Todo
  addTodo(BuildContext context) async {
    TextEditingController _title = TextEditingController();
    TextEditingController _subTitle = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text("Add To Do")),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _title,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _subTitle,
                  decoration: const InputDecoration(hintText: "Subtitle"),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          final TodoModel todo = TodoModel(
                            title: _title.text.trim(),
                            subtitle: _subTitle.text.trim(),
                            uuid: "uuid",
                            isCompleted: false,
                          );
                          context.read<TodoBloc>().add(AddTodo(todo: todo));
                          Navigator.pop(context);
                        },
                        child: const Text("Add")),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Update Todo
  updateTodo(BuildContext context, int index, TodoModel todo) async {
    TextEditingController _title = TextEditingController(text: todo.title);
    TextEditingController _subTitle =
        TextEditingController(text: todo.subtitle);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text("Add To Do")),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _title,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _subTitle,
                  decoration: const InputDecoration(hintText: "Subtitle"),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          final TodoModel todo = TodoModel(
                            title: _title.text.trim(),
                            subtitle: _subTitle.text.trim(),
                            uuid: "uuid",
                            isCompleted: false,
                          );
                          context.read<TodoBloc>().add(UpdateTodo(todo, index));
                          Navigator.pop(context);
                        },
                        child: const Text("Add")),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
