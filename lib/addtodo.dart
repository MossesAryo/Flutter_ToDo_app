import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;

  AddTodo({super.key, required this.addTodo});

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
          onSubmitted: (value) {
             if (todotext.text.isNotEmpty  ) {
                widget.addTodo(todoText: todotext.text);
              } 
              todotext.text = "";
          },
          autofocus: true,
          controller: todotext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: "write your todo",
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (todotext.text.isNotEmpty  ) {
                widget.addTodo(todoText: todotext.text);
              } 
              todotext.text = "";
            },
            child: Text('add '))
      ],
    );
  }
}
