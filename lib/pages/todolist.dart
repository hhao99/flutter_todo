import 'package:flutter/material.dart';

import 'package:todo_app/model/todo.dart';

class TodoListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState ()=> _TodoListState();

}

class _TodoListState extends State<TodoListPage> {
  List<Todo> todos = []
    ..add(Todo('1st task'))
    ..add(Todo('2nd task'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App"),),
      body: Center(
        child: 
          ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Checkbox(
                  onChanged: (e){
                    setState(() {
                      todos[index].isDone = !todos[index].isDone;
                    });
                    
                  },      
                  value: todos[index].isDone
                  ),
                  Text(todos[index].task )
                ],
              );
            })
        ),
        floatingActionButton: IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text("New Todo"),
                content: Form(
                  child: TextFormField(
                    autofocus: true,
                    initialValue: "new task",
                    onFieldSubmitted: (e){
                      setState(() {
                        todos.add(Todo(e));
                      });
                      Navigator.pop(context);
                      },
                    ),
                  ),
              )
            );
          },
        ),
      );
  }
}