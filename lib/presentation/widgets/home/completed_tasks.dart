import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CompletedTaskWidget extends StatefulWidget {
  const CompletedTaskWidget({super.key});

  @override
  State<CompletedTaskWidget> createState() => _CompletedTaskWidgetState();
}

class _CompletedTaskWidgetState extends State<CompletedTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Container(
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          color: Colors.green,
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
            const Icon(
              Icons.check_box_outlined,
              color: Colors.white,
              size: 70,
            ),
            const Text(
              'Completed',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              taskProvider.totalCompleted.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
/*
This widget is used to display the total number of completed tasks. It uses the Provider package to access the TaskProvider class, which provides the necessary data to display. The widget consists of a Container with a green background and a Column of elements including an icon, text, and the total number of completed tasks.

Here's a breakdown of the widget's structure:

Container: This is the outermost element of the widget. It has a green background color and a BoxDecoration that applies a shadow and rounded corners to the container.

Column: This is the main content of the widget, containing the icon, text, and number of completed tasks. The mainAxisAlignment property is set to MainAxisAlignment.center to vertically center the elements.

Icon: This is the first element in the column and displays an outlined checkbox icon in white color.

Text: This is the second element in the column and displays the text "Completed" with a font size of 25.

Text: This is the third element in the column and displays the total number of completed tasks. It gets the value from the TaskProvider class and applies a bold font weight to the text.
 */