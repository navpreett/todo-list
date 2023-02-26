import 'package:WhatToDo/shared/enum/category_enum.dart';
import 'dart:convert';

class Task {
  int id;
  String title;
  String date;
  int time;
  CategoryEnum category;

  Task(
      {required this.id,
      required this.title,
      required this.date,
      required this.time,
      required this.category});

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
      id: jsonData['id'],
      title: jsonData['title'],
      date: jsonData['date'],
      time: jsonData['time'],
      category: CategoryEnum.values.byName(jsonData['category']),
    );
  }

  static Map<String, dynamic> toMap(Task task) => {
        'id': task.id,
        'title': task.title,
        'date': task.date,
        'time': task.time,
        'category': task.category.name,
      };

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
      );

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item))
          .toList();
}
/*
This code defines a Task class that represents a task with an id, title, date, time, and category. It also provides two methods for encoding and decoding a list of Task objects to and from JSON format.

The Task class has a constructor that takes all the necessary parameters as named parameters. The required keyword is used to indicate that these parameters must be provided when creating an instance of the class.

The fromJson factory method is used to create a Task object from a JSON object. It takes a Map<String, dynamic> object as its parameter, which is the result of decoding a JSON string using the json.decode method. The method extracts the values of the fields from the JSON object and passes them to the constructor of the Task class.

The toMap method is used to convert a Task object to a Map<String, dynamic> object. This is useful when encoding the object to JSON format. The method returns a map that contains the values of the fields of the Task object.

The encode method takes a list of Task objects and returns a JSON-encoded string that represents the list. It does this by calling the toMap method for each Task object in the list, and then encoding the list of maps to a JSON string using the json.encode method.

The decode method takes a JSON-encoded string as its parameter and returns a list of Task objects. It does this by decoding the JSON string using the json.decode method, which returns a list of maps. The method then maps each map in the list to a Task object using the fromJson factory method. And that returns a list of Task objects.
 */