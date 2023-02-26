import 'package:flutter/material.dart';
import 'package:WhatToDo/models/task_model.dart';
import 'package:WhatToDo/shared/enum/category_enum.dart';
import 'package:WhatToDo/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:WhatToDo/shared/utils/capitalize.dart';

class CreateTaskBottomWidget extends StatefulWidget {
  const CreateTaskBottomWidget({super.key, required this.isGlobal});

  final bool isGlobal;

  @override
  State<CreateTaskBottomWidget> createState() => _CreateTaskBottomWidgetState();
}

class _CreateTaskBottomWidgetState extends State<CreateTaskBottomWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    String title = '';
    TextEditingController myController = TextEditingController();

    void addTasK() {
      setState(() {
        title = myController.text;
        myController.clear();
        int currentTime = DateTime.now().millisecondsSinceEpoch;

        taskProvider.addTask(Task(
          id: currentTime,
          date: DateTime.now().toString().substring(0, 10),
          time: currentTime,
          title: title,
          category: taskProvider.initialCategory,
        ));
      });
    }

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          builder: (BuildContext context) => StatefulBuilder(
            builder: (context, setModalState) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 320,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('New Task ',
                                    style: TextStyle(fontSize: 30)),
                                Icon(Icons.task, size: 30)
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task',
                            hintText: 'Enter task',
                          ),
                          controller: myController,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 5),
                        child: Text('Category', style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: DropdownButton(
                            value: taskProvider.initialCategory,
                            borderRadius: BorderRadius.circular(10),
                            items: widget.isGlobal == true
                                ? const <DropdownMenuItem>[
                                    DropdownMenuItem(
                                      value: CategoryEnum.health,
                                      child: Text('Health'),
                                    ),
                                    DropdownMenuItem(
                                      value: CategoryEnum.personal,
                                      child: Text('Personal'),
                                    ),
                                    DropdownMenuItem(
                                      value: CategoryEnum.study,
                                      child: Text('Study'),
                                    ),
                                    DropdownMenuItem(
                                      value: CategoryEnum.work,
                                      child: Text('Work'),
                                    ),
                                  ]
                                : null,
                            disabledHint: Text(
                              taskProvider.initialCategory.name.capitalize(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              setModalState(() {
                                taskProvider.updateCategory(value);
                              });
                              setState(() {
                                taskProvider.updateCategory(value);
                              });
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      // Add Select category here
                      Center(
                        child: myController.text.isNotEmpty
                            ? ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(200, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.brown[300]!),
                                ),
                                child: const Text('Create Task'),
                                onPressed: () => {
                                  if (myController.text.isNotEmpty)
                                    {
                                      addTasK(),
                                      Navigator.pop(context),
                                    }
                                },
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(200, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                child: const Text('Create Task'),
                                onPressed: () => {},
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      tooltip: 'Add task',
      backgroundColor: Colors.green,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}

/*

This file allows users to create a new task by filling out a form. The form contains a text field for the task name and a dropdown button to select a category for the task.

The code uses Provider package to manage the state of the app and keep track of the task data.

The widget is called CreateTaskBottomWidget and it extends StatefulWidget.

It takes a boolean isGlobal parameter to determine if the category dropdown should show a list of pre-defined categories or not.

The widget's build method returns a FloatingActionButton with an onPressed callback that opens a modal bottom sheet when clicked. The modal bottom sheet shows the task form, which consists of a text field, a dropdown button, and a "Create Task" button.

When the user fills out the form and clicks the "Create Task" button, the addTask function is called.

This function retrieves the task data from the form and creates a new Task object using the TaskProvider to add the task to the app's state. The modal bottom sheet is then closed using Navigator.pop.

The CreateTaskBottomWidget uses StatefulBuilder to allow updating the state of the modal bottom sheet when the category dropdown is changed.

The onChanged callback of the dropdown button updates the app's state with the new category selected by the user.

The widget also contains a showModalBottomSheet method that creates the bottom modal sheet.

The showModalBottomSheet method creates a StatefulBuilder that enables the widget to modify the modal sheet's state when the user changes the task category.

Overall, this widget provides a simple and user-friendly interface for adding new tasks to the task list.
 */