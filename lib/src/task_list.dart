
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:promise/src/model/task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  List<Task> _tasks; 

  @override
  void initState() {
    super.initState();
    // TODO query cache for tasks
    _tasks = [Task("Task 1"), Task("Task 2"), Task("Task 3")];
  }

  Widget buildTask(Task task) {
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        setState(() {
          _tasks.remove(task);
        });
        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text(task.getTitle() + " dismissed")));
      },
      child: Container(
        height: 75,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Material(
            color: Colors.blue[50],
            child: ListTile(
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  task.getTitle(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ReorderableListView(
        padding: const EdgeInsets.all(8.0),
        children: _tasks.map(
          (task) => buildTask(task)).toList(), 
        onReorder: (prevIndex, newIndex) {
          setState(() {
            _tasks.insert(newIndex, _tasks[prevIndex]);
            _tasks.removeAt(prevIndex);
          });
        }
      ),
    );
  }
}