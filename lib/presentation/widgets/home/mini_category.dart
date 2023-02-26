import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:WhatToDo/shared/utils/category_map.dart';
import 'package:provider/provider.dart';

import '../../../shared/enum/category_enum.dart';

class MiniCategoryWidget extends StatefulWidget {
  const MiniCategoryWidget({super.key, required this.category});

  final CategoryEnum category;

  @override
  State<MiniCategoryWidget> createState() => _MiniCategoryWidgetState();
}

class _MiniCategoryWidgetState extends State<MiniCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        taskProvider.updateCategory(widget.category);
        Navigator.pushNamed(context, '/category/${widget.category.name}');
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
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
                  Text(
                    categoryMapEmoji[widget.category]!,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    taskProvider.countCategory(widget.category).toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
/*
This mini category card with a category emoji and the number of tasks in that category.

The card is also tappable and navigates to the corresponding category page when pressed.

Category is a required CategoryEnum object that represents the category for this mini category card.

And build(BuildContext context) method that returns the widget tree to be displayed on the screen.

The method uses a GestureDetector to make the card tappable and uses the Provider library to update the category and navigate to the corresponding category page.

The categoryMapEmoji is used to display the corresponding emoji for the category, and the countCategory method from the TaskProvider is used to display the number of tasks in that category.

The widget is wrapped in a Container with a specific width, height, and decoration to create the mini category card.

 */