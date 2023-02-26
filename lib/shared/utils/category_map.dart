import 'package:flutter/material.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';

const Map<CategoryEnum, Icon> categoryMapIconData = {
  CategoryEnum.health: Icon(
    Icons.favorite,
    color: Colors.red,
  ),
  CategoryEnum.personal: Icon(Icons.face),
  CategoryEnum.study: Icon(Icons.assignment, color: Colors.blueAccent),
  CategoryEnum.work: Icon(Icons.work, color: Colors.cyan)
};

const Map<CategoryEnum, String> categoryMapEmoji = {
  CategoryEnum.health: '🏥',
  CategoryEnum.personal: '👨‍👩‍👧‍👦',
  CategoryEnum.study: '📚',
  CategoryEnum.work: '👨‍💻'
};

const Map<CategoryEnum, double> categoryMapFontsize = {
  CategoryEnum.health: 60,
  CategoryEnum.personal: 50,
  CategoryEnum.study: 60,
  CategoryEnum.work: 60
};
/*
This file defines three Map variables with key-value pairs that map CategoryEnum values to corresponding icons, emojis, and font sizes.

categoryMapIconData maps CategoryEnum values to Icon widgets, where each Icon corresponds to a specific category and has a specific color. CategoryEnum.health is mapped to an Icon widget with a red heart-shaped icon, CategoryEnum.personal is mapped to an Icon widget with a default face icon, CategoryEnum.study is mapped to an Icon widget with a blue book icon, and CategoryEnum.work is mapped to an Icon widget with a cyan-colored work icon.

categoryMapEmoji maps CategoryEnum values to corresponding emojis, where each emoji corresponds to a specific category.CategoryEnum.health is mapped to a hospital emoji, CategoryEnum.personal is mapped to a family emoji, CategoryEnum.study is mapped to a book emoji, and CategoryEnum.work is mapped to a computer worker emoji.

categoryMapFontsize maps CategoryEnum values to corresponding font sizes, where each font size corresponds to a specific category. CategoryEnum.health is mapped to a font size of 60, CategoryEnum.personal is mapped to a font size of 50, CategoryEnum.study is mapped to a font size of 60, and CategoryEnum.work is mapped to a font size of 60.
 */