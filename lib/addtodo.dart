import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

TextEditingController todotext = TextEditingController();

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo:"),
        TextField(
          controller: todotext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: "write your todo",
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print(todotext.text);
              todotext.text = "";
            },
            child: Text('add '))
      ],
    );
  }
}
