# todo_list_app

A new Flutter project.

## Getting Started

This project is a starting point for a Todo list Flutter application.
Following things have been used in Project Setup and execution.

Database Integration (SQFLite):
Implemented DatabaseHelper for database initialization and to write CRUD Operations like insertTodo, updateTodo and deleteTodo.

State Management Approach(Bloc):

Used Bloc Cubit for managing the state of todo items.
Implemented TodoCubit to handle CRUD operations and TodoState for state updates.

UI Design:

The todo list screen will display a list of todos with options to add, mark as complete, and delete items. We’ll use a ListView to present the todos and a TextField for adding new items.

Key Features:
A top AppBar with the title "Todo List".
A TextField to enter new todo items.
'+' Button to insert todo.
A ListView to display the list of todos.
Each list item will have a Checkbox to indicate completion status and a Delete icon to remove the item.
