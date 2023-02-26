import 'package:flutter/material.dart';
import 'package:WhatToDo/presentation/widgets/home/calendar_tasks.dart';
import 'package:WhatToDo/presentation/widgets/home/completed_tasks.dart';
import 'package:WhatToDo/presentation/widgets/home/global_tasks.dart';
import '../../shared/enum/category_enum.dart';
import '../widgets/home/active_tasks.dart';
import '../widgets/home/mini_category.dart';
import '../widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
            title: 'WhatToDo ', iconData: Icons.task, disableIcon: false),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const ActiveTasksWidget(),
                const SizedBox(
                  height: 20,
                ),
                const CalendarTaskWidget(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [CompletedTaskWidget(), GlobalTaskWidget()],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MiniCategoryWidget(category: CategoryEnum.health),
                    MiniCategoryWidget(category: CategoryEnum.work),
                    MiniCategoryWidget(category: CategoryEnum.personal),
                    MiniCategoryWidget(category: CategoryEnum.study)
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(1));
  }
}
/*

The home page displays a list of active tasks, completed tasks, global tasks, and mini categories.

The category page displays a list of categories that the user can select to view tasks related to that category.

The category task page displays tasks related to the selected category, and the user can create new tasks or delete existing tasks.

The app uses Provider package to manage the state of the tasks, and it uses various widgets such as ListView, SliverList, AppBar, and BottomNavigationBar.
 */