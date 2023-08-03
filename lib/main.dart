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
          hoverColor: Color.fromARGB(223, 6, 18, 109),
          onPressed: () {
            Navigator.push(
                context, PageRouteBuilder(pageBuilder: (_, __, ___) => Task()));
          },
          tooltip: "add task",
          child: const Icon(Icons.add),
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
  final List<Map<String, String>> _todoItems = [
    {
      "title": "Faire du velo",
      "author": "moussa",
      "date": DateTime.now().toString(),
      "photo": "moussa.jpeg"
    },
    {
      "title": "Avancer dans la vie",
      "author": "malick",
      "date": DateTime.now().toString(),
      "photo": "khadim.png"
    },
    {
      "title": "Faire le ménage",
      "author": "lamine",
      "date": DateTime.now().toString(),
      "photo": "lamine.jpeg"
    },
    {
      "title": "Ranger ces affaires",
      "author": "khadim",
      "date": DateTime.now().toString(),
      "photo": "khadim.png"
    },
    {
      "title": "Aller à l'école",
      "author": "lamine",
      "date": DateTime.now().toString(),
      "photo": "lamine.jpeg"
    },
    {
      "title": "Vivre dans sa vie",
      "author": "lamine",
      "date": DateTime.now().toString(),
      "photo": "lamine.jpeg"
    },
        {
      "title": "Ranger ces affaires",
      "author": "khadim",
      "date": DateTime.now().toString(),
      "photo": "khadim.png"
    },


  ];
  List<Map<String, String>> _matching = [];

  @override
  void initState() {
    _matching = _todoItems;
    super.initState();
  }

  void _filter(String value) {
    List<Map<String, String>> res = [];
    if (value.isEmpty) {
      res = _todoItems;
    } else {
      res = _todoItems.where((element) =>
          element["author"]!.toLowerCase().startsWith(value.toLowerCase())).toList();
    }
    setState(() {
      _matching = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: "Search", suffixIcon: Icon(Icons.search)),
            onChanged: (value) => _filter(value),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final todoItem = _matching[index];
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
              itemCount: _matching.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("data"),
    );
  }
}
