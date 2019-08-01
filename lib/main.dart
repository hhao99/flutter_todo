import 'package:flutter/material.dart';
import 'package:todo_app/pages/todolist.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home: TodoListPage()
  );
  }
}
