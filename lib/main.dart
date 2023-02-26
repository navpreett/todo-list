import 'package:flutter/material.dart';
import 'package:WhatToDo/presentation/pages/category/category_page.dart';
import 'package:WhatToDo/presentation/pages/category/category_task_page.dart';
import 'package:WhatToDo/presentation/pages/home_page.dart';
import 'package:WhatToDo/presentation/pages/task_page.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/categories': (context) => const CategoryPage(),
          '/tasks': (context) => const TaskPage(),
          '/category/health': (context) =>
              const CategoryTaskPage(category: CategoryEnum.health),
          '/category/work': (context) => const CategoryTaskPage(
                category: CategoryEnum.work,
              ),
          '/category/personal': (context) => const CategoryTaskPage(
                category: CategoryEnum.personal,
              ),
          '/category/study': (context) => const CategoryTaskPage(
                category: CategoryEnum.study,
              ),
        },
      ),
    );
  }
}
/*
The MyApp widget is the root of the application and it sets up the MaterialApp with the necessary providers, routes, and theme.

The MultiProvider widget is used to provide the TaskProvider to the entire widget tree. This provider is used to manage the state of the tasks.

The MaterialApp widget sets up the theme of the app and the initial route to be displayed. The HomePage is the initial route.

The routes property is used to set up all the possible routes that the app can navigate to.

The CategoryTaskPage widget is used to display the tasks associated with a specific category. T

he CategoryPage displays all the categories and allows the user to navigate to the tasks associated with each category.

The runApp method is called to start the application with the MyApp widget.
 */