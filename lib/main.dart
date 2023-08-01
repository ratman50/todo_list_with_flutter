// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("todo list"),
        ),
        body: TodoList(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){}
          ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  
  final _todoItems = [
    {
      "title": "Faire du velo",
      "author": "Moussa",
      "date": DateTime.now(),
      "photo":"moussa.jpeg"
    },
    {
      "title": "Faire le ménage",
      "author": "Lamine",
      "date": DateTime.now(),
      "photo":"lamine.jpeg"
    },
    {
      "title": "Ranger ces affaires",
      "author": "Khadim",
      "date": DateTime.now(),
      "photo":"khadim.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final todoItem = _todoItems[index];
          return Card(
              child: ListTile(
            leading: Image.asset(
              'assets/images/${todoItem['photo']}',

              width: 50,
              ),
            title: Text('${todoItem["title"]}  (${todoItem["author"]})'),
            subtitle: Text(todoItem["date"]!.toString()),
            trailing: Icon(Icons.more_vert),
          )); 
        },
        itemCount: _todoItems.length,
      ),
    );
  }
}
