
import 'package:flutter/material.dart';
import 'package:promise/src/task_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'PROMISE',
          style: TextStyle(
            color: Colors.blue,
            letterSpacing: 8.0,
          )
        ),
      ),
      body: TaskList(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}