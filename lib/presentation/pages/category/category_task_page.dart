import 'package:flutter/material.dart';
import 'package:WhatToDo/presentation/widgets/index.dart';
import 'package:WhatToDo/presentation/widgets/tasks/create_task.dart';
import 'package:WhatToDo/presentation/widgets/tasks/nothing_today.dart';
import 'package:WhatToDo/presentation/widgets/tasks/task_tile.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:WhatToDo/shared/utils/category_map.dart';
import 'package:WhatToDo/shared/utils/capitalize.dart';
import 'package:provider/provider.dart';

class CategoryTaskPage extends StatefulWidget {
  const CategoryTaskPage({super.key, required this.category});

  final CategoryEnum category;

  @override
  State<CategoryTaskPage> createState() => _CategoryTaskPageState();
}

class _CategoryTaskPageState extends State<CategoryTaskPage> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: AppBarWidget(
          title:
              '${widget.category.name.capitalize()} ${categoryMapEmoji[widget.category]!}',
          disableIcon: true,
          fontSize: categoryMapFontsize[widget.category]!,
        ),
        body: taskProvider.getTaskByCategory.isEmpty
            ? const NothingTodayWidget()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: taskProvider.getTaskByCategory.length,
                  itemBuilder: (context, index) {
                    final item = taskProvider.getTaskByCategory[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: TaskTileWidget(
                          item: item,
                          callback: () {
                            setState(() {
                              taskProvider.eliminateTaskByCategory(index);
                            });
                          },
                        ));
                  },
                ),
              ),
        floatingActionButton: const CreateTaskBottomWidget(
          isGlobal: false,
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
/*
This code defines a CategoryTaskPage widget that displays a list of tasks for a specific category. The widget is built using a Scaffold widget, a ListView.builder, and several other custom widgets.

The CategoryTaskPage widget has a category property that specifies the category of tasks to be displayed.

The build method of the CategoryTaskPage widget returns a Scaffold widget with an AppBarWidget, ListView.builder, and BottomNavigationBarWidget.

The AppBarWidget displays the name of the category and an emoji icon that represents the category. The fontSize property is set to a value based on the category to adjust the size of the text.

The ListView.builder displays a list of TaskTileWidget widgets, one for each task in the specified category. The itemCount property is set to the number of tasks in the category, and the itemBuilder property is used to create a TaskTileWidget for each task.

The TaskTileWidget displays the title, date, and time of a task. When the user taps the task, the callback function is called, which removes the task from the list.

If there are no tasks in the specified category, the NothingTodayWidget is displayed instead of the ListView.builder.

The floatingActionButton is used to display a button that allows the user to create a new task for the specified category.

The isGlobal property is set to false to indicate that the task should be created for the specified category.

The BottomNavigationBarWidget is used to display a bottom navigation bar with four items, one for each category. The selected item is highlighted by setting the currentIndex property to 2.
 */