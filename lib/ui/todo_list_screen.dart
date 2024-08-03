import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubit/todo_cubit.dart';
import 'package:todo_list_app/states/todo_state.dart';

class TodoListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a new todo',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = _controller.text;
                    if (title.isNotEmpty) {
                      context.read<TodoCubit>().addTodo(title);
                      _controller.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                final todos = state.todos;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo['title'] , style: TextStyle(
                        color:  todo['isComplete'] == 1?Colors.green: Colors.red,
                        fontWeight: FontWeight.bold
                      ),),
                      subtitle: Text(todo['isComplete'] == 1?'Completed':'Pending' , style: TextStyle(
                          color:  todo['isComplete'] == 1?Colors.green: Colors.red
                      ),),
                      leading: Checkbox(
                        value: todo['isComplete'] == 1,
                        activeColor:  Colors.green,
                        onChanged: (value) {
                          context.read<TodoCubit>().updateTodo(
                            todo['id'],
                            value ?? false,
                          );
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete,color: Colors.red,),
                        onPressed: () {
                          context.read<TodoCubit>().deleteTodo(
                            todo['id'],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}