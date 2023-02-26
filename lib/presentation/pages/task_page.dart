import 'package:flutter/material.dart';
import 'package:WhatToDo/presentation/widgets/tasks/create_task.dart';
import 'package:WhatToDo/presentation/widgets/tasks/nothing_today.dart';
import 'package:WhatToDo/presentation/widgets/tasks/task_tile.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/index.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Tasks',
          disableIcon: false,
          iconData: Icons.task_alt,
        ),
        body: taskProvider.myTasks.isEmpty
            ? const NothingTodayWidget()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: taskProvider.myTasks.length,
                  itemBuilder: (context, index) {
                    final item = taskProvider.myTasks[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: TaskTileWidget(
                          item: item,
                          callback: () {
                            setState(() {
                              taskProvider.eliminateTask(index);
                            });
                          },
                        ));
                  },
                ),
              ),
        floatingActionButton: const CreateTaskBottomWidget(isGlobal: true),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
/*
TaskPage widget that displays a list of tasks. The TaskPage widget has a State class _TaskPageState that implements the logic for building the UI.

AppBarWidget: displays the app bar with a title and an icon.

body: displays either a NothingTodayWidget widget if the task list is empty, or a ListView.builder widget that displays a list of TaskTileWidgets for each task in the myTasks list of the TaskProvider object.

floatingActionButton: displays a CreateTaskBottomWidget widget that allows the user to create a new task.

bottomNavigationBar: displays a BottomNavigationBarWidget widget that shows the app's bottom navigation bar with three tabs.

The TaskPage widget uses the Provider package to get the TaskProvider object, which provides access to the myTasks list and the eliminateTask method.

The setState method is called when a task is deleted so that the UI is updated to reflect the change.
 */