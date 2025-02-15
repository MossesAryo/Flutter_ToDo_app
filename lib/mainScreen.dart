import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';
import 'package:todoapp/widget/listbuilder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('To Do already exists'),
                content: Text('Please enter a new To Do'),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('close'),
                  )
                ]);
          });

      return;
    }

    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }

  void showModalToDo() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blueGrey[900],
              child: Center(
                  child: Text(
                "Todo App",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Me'),
            )
          ]),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo App'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(onTap: showModalToDo, child: Icon(Icons.add)),
            )
          ],
        ),
        body:
            Listbuilder(todoList: todoList, updateLocalData: updateLocalData));
  }
}
