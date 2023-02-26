# ~ WhatToDo ~
This project creates a todo app in flutter, which basically shows the user all their task.

# -- Features --
- User can add new tasks
- Once the task has been completed the user can slide to show that the task as been successfully completed.
- User can categories their tasks to their liking.
- User can navigate very easily.
- User can also check the total number of task(s) in each category and they can see all the tasks from all category as well.
- The uses of icons are used to make it more user-friendly.


# Pain Points:
- One of the biggest issue in ToDo-list apps are that they usually don't have the count of total tasks and the total number of task completed. 
- So I've added that in the Home page, so as the user are done and completed their tasks, the home page displays the number of task(s) they have finished and the number of task(s) they are left to be done with.
- I've used the TaskProvider to get the list of tasks and display the count, GestureDetector that listens for a tap event and navigates to the tasks route when tapped. 
- And two Text widgets that display the text "Total Active tasks" and the total number of active tasks.
- In order to see the total counts I've added a "completed tasks" widget which basically displays the total number of completed tasks. It uses the Provider package to access the TaskProvider class, which provides the necessary data to display.

- Not only that, but not being able to separate categories are also another point that restricts the user from being able to see tasks from that category.
- So I've added ability to create categories and subcategories. The type of work it is, is separated in different categories and there is all in one as well. The user can also view all the tasks from  all category as well. 
- Ive used CategoryPage widget that displays a list of CategoryWidget widgets for each category in the CategoryEnum.
- Then CategoryPage widget that returns a Scaffold widget with an AppBarWidget, a CustomScrollView, and a BottomNavigationBarWidget. 
- Each CategoryWidget is created with a CategoryEnum parameter that specifies the category of the widget. The CategoryWidget is responsible for displaying the category name and an icon that represents the category.
- Ive also made a CategoryTaskPage widget that displays a list of tasks for a specific category. The widget is built using a Scaffold widget, a ListView.builder, and several other custom widgets. 
- The AppBarWidget is used to display the title of the page and to disable the back arrow icon by setting disableIcon to true.


- I've also made user that it is easier for the user to be able to add their task(s) no matter which page they are in.
- This is also something that is not seen in most of the ToDo-list apps.


