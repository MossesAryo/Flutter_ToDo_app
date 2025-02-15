import 'package:flutter/material.dart';

class Listbuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  Listbuilder({
    super.key,
    required this.todoList,
    required this.updateLocalData,
  });

  @override
  State<Listbuilder> createState() => _ListbuilderState();
}

class _ListbuilderState extends State<Listbuilder> {
  void onItemClicked({
    required int index,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                  Navigator.pop(context);
                },
                child: Text('Mark As done')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return widget.todoList.isEmpty
        ? Center(
            child: Text(
            "To Do List is empty",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  onItemClicked(index: index);
                },
                title: Text(widget.todoList[index]),
              );
            });
  }
}
