import 'package:flutter/material.dart';
import 'package:todoapp/addTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = ["Drink Water", "Make Dinner", "Sleep"];

  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo App'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 200,
                              child: AddTodo(
                                addTodo: addTodo,
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.add)),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  todoList.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Mark As done')),
                        );
                      });
                },
                title: Text(todoList[index]),
              );
            }));
  }
}
