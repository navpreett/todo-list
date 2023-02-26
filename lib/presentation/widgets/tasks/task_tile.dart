import 'package:flutter/material.dart';
import 'package:WhatToDo/models/task_model.dart';
import 'package:WhatToDo/shared/utils/category_map.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({super.key, required this.item, required this.callback});

  final Task item;
  final Function callback;

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key(widget.item.id.toString()),
      onDismissed: (direction) {
        setState(() {
          widget.callback();
        });
      },
      background: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 5, 83, 8),
          child: Row(children: const [
            Icon(Icons.task_alt, color: Colors.white, size: 40),
            Text(
              'Completed',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ])),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                categoryMapEmoji[widget.item.category].toString(),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.item.title,
                style: const TextStyle(fontSize: 23),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
This file is used to show a task's information, including its category, title, and completion status.

The widget also allows the user to mark a task as completed by swiping it to the left.

The TaskTileWidget is a StatefulWidget, which means that it can hold mutable state.

The item parameter is a Task object that contains the task's information, and callback parameter is a function that will be called when the user swipes the tile to mark the task as completed.

The build method of the widget returns a Dismissible widget, which is used to make the task tile swipe able. The background property of the Dismissible widget is a Container widget that displays a green background with an icon and text indicating that the task has been completed.

 The child property of the Dismissible widget is a Container widget that displays the task's category emoji, title, and other information.

The widget uses the categoryMapEmoji map to display the appropriate emoji for each task category. This map is imported from category_map.dart.

When the user swipes the task tile to the left, the onDismissed property of the Dismissible widget is called.

This property is a callback that takes a DismissDirection parameter indicating the direction of the swipe. In this case, the onDismissed callback simply calls the callback function passed in as a parameter to mark the task as completed.

Finally, the setState method is called to rebuild the widget tree and reflect the updated state.


 */