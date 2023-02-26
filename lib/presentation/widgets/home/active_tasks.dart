import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class ActiveTasksWidget extends StatefulWidget {
  const ActiveTasksWidget({super.key});

  @override
  State<ActiveTasksWidget> createState() => _ActiveTasksWidgetState();
}

class _ActiveTasksWidgetState extends State<ActiveTasksWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tasks');
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Active tasks',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    taskProvider.myTasks.length.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Icon(
                Icons.library_add_check,
                color: Colors.blue,
                size: 70,
              )
            ],
          )),
    );
  }
}
/*
The ActiveTasksWidget is a stateful widget that displays the total number of active tasks in the task list. It uses the TaskProvider to get the list of tasks and display the count.

The widget has a GestureDetector that listens for a tap event and navigates to the tasks route when tapped.

The widget has a container with a fixed height and width that contains a Row with two columns.

The first column contains a Column with two Text widgets that display the text "Total Active tasks" and the total number of active tasks.

The second column contains an Icon widget with the library_add_check icon, which is colored in blue.

 */