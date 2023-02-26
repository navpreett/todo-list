import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:WhatToDo/shared/utils/category_map.dart';
import 'package:provider/provider.dart';
import 'package:WhatToDo/shared/utils/capitalize.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.category, {super.key});

  final CategoryEnum category;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        taskProvider.updateCategory(category);
        Navigator.pushNamed(context, '/category/${category.name}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(categoryMapEmoji[category].toString(),
                  style: const TextStyle(fontSize: 60)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(category.name.capitalize(),
                    style: const TextStyle(fontSize: 30)),
                Text('Tasks: ${taskProvider.countCategory(category)}',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
The CategoryWidget widget displays a category item that contains an emoji icon, the name of the category, and the number of tasks associated with that category.

GestureDetector: captures user taps on the category item and navigates to the category's tasks page.

Container: wraps the category item and adds a box shadow, a border radius, and some margin.

Row: displays the emoji icon and the category's name and tasks count.

Text: displays the category's name and tasks count.

Padding: adds some padding around the emoji icon.

The CategoryWidget widget uses the Provider package to get the TaskProvider object, which provides access to the countCategory method for counting the number of tasks in the specified category and the updateCategory method for updating the selectedCategory field of the TaskProvider object.

The capitalize utility function is used to capitalize the first letter of the category's name.

The categoryMapEmoji is a map that associates each CategoryEnum value with an emoji icon.

 */