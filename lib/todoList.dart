import 'package:flutter/material.dart';
import 'package:piseth_mobile_project/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();
  _toggletodo(todo, isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggletodo(todo, isChecked);
      },
    );
  }

  _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New todo'),
          //  content: TextField(),
          //  content: TextField(controller: controller),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  final todo = new Todo(title: controller.value.text);
                  if(controller.value.text == ""){
                    print(" ");
                  }else{
                  todos.add(todo);
                 
                  }
                   controller.clear();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}