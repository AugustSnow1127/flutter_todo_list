import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<String> _todos = ['todo'];
  final List<String> _doneTodos = ['done'];

  void addTodo(String task) {
    if (task.trim() == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('待辦事項不可為空')));
    } else {
      setState(() {
        _todos.insert(0, task);
      });
    }
  }

  void markAsDone(int index) {
    setState(() {
      _doneTodos.insert(0, _todos[index]);
      _todos.removeAt(index);
    });
  }

  void removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _todos.length +
          _doneTodos.length +
          2, // +2 for the TODO and DONE headers
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header for TODO list
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'TODO:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        } else if (index <= _todos.length) {
          // Items in TODO list
          final todoIndex = index - 1;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: ListTile(
                title: Text(_todos[todoIndex]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () => markAsDone(todoIndex),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeTodo(todoIndex),
                    ),
                  ],
                ),
                tileColor: const Color.fromARGB(255, 201, 243, 242),
              ),
            ),
          );
        } else if (index == _todos.length + 1) {
          // Header for DONE list
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DONE:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        } else {
          // Items in DONE list
          final doneIndex = index - _todos.length - 2;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: ListTile(
                title: Text(_doneTodos[doneIndex]),
                tileColor: const Color.fromARGB(255, 200, 255, 200),
              ),
            ),
          );
        }
      },
    );
  }
}
