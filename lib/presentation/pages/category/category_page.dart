import 'package:flutter/material.dart';
import 'package:WhatToDo/presentation/widgets/category/category.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';
import '../../widgets/index.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Categories',
          disableIcon: true,
          fontSize: 50,
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const CategoryWidget(CategoryEnum.personal),
                const CategoryWidget(CategoryEnum.study),
                const CategoryWidget(CategoryEnum.health),
                const CategoryWidget(CategoryEnum.work),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: const BottomNavigationBarWidget(0));
  }
}

/*
This code defines a CategoryPage widget that displays a list of CategoryWidget widgets for each category in the CategoryEnum. The widget is built using a CustomScrollView and a SliverList.

The CategoryPage widget has a build method that returns a Scaffold widget with an AppBarWidget, a CustomScrollView, and a BottomNavigationBarWidget.

The CustomScrollView contains a single SliverList, which displays a list of CategoryWidget widgets. The SliverChildListDelegate is used to provide a list of child widgets to the SliverList.

Each CategoryWidget is created with a CategoryEnum parameter that specifies the category of the widget. The CategoryWidget is responsible for displaying the category name and an icon that represents the category.

The AppBarWidget is used to display the title of the page and to disable the back arrow icon by setting disableIcon to true.

The BottomNavigationBarWidget is used to display a bottom navigation bar with four items, one for each category. The selected item is highlighted by setting the currentIndex property to 0.

 */