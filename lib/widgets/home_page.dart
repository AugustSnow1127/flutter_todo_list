import 'package:flutter/material.dart';
import 'todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListKey =
        GlobalKey<TodoListState>(); // 定義一個 GlobalKey 來控制 TodoList

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 242, 153, 135),
      ),
      body: Center(
        child: TodoList(key: todoListKey),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              String newTask = '';
              return AlertDialog(
                title: const Text('新增待辦事項'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                  decoration: const InputDecoration(
                    hintText: '請輸入待辦事項',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () {
                      todoListKey.currentState?.addTodo(newTask);
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('確定'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
