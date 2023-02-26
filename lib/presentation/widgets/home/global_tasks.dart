import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class GlobalTaskWidget extends StatefulWidget {
  const GlobalTaskWidget({super.key});

  @override
  State<GlobalTaskWidget> createState() => _GlobalTaskWidgetState();
}

class _GlobalTaskWidgetState extends State<GlobalTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Container(
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          color: Colors.yellow,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🌎',
              style: TextStyle(fontSize: 66),
            ),
            // const Icon(
            //   Icons.check_circle,
            //   color: Colors.green,
            //   size: 80,
            // ),
            const Text(
              'All Tasks',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              taskProvider.global.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
/*
This widget depends on a TaskProvider that is obtained using the Provider.of method, which is a part of the provider package.

It is used to access the global property of the TaskProvider instance, which represents the total number of global tasks.

The widget is called GlobalTaskWidget and extends the StatefulWidget class. It has a private state class _GlobalTaskWidgetState that is responsible for building the widget.

In the build method of _GlobalTaskWidgetState, the MediaQuery widget is used to get the width of the screen and calculate the width of the container.

Then, the Container widget is returned with the specified decoration and child widgets.

Overall, this widget is used to display the number of global tasks in a visually appealing way.
 */