import 'package:flutter/material.dart';
import 'todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: TodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 確保上下文來自 MaterialApp 的後代
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
                      // TODO: 實作新增待辦事項的功能
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
