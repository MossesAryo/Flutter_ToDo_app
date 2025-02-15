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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList.length,
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
                              widget.todoList.removeAt(index);
                            });
                            widget.updateLocalData();
                            Navigator.pop(context);
                          },
                          child: Text('Mark As done')),
                    );
                  });
            },
            title: Text(widget.todoList[index]),
          );
        });
  }
}
