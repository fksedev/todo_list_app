
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/helper/database_helper.dart';
import 'package:todo_list_app/states/todo_state.dart';

// Cubit implementation
class TodoCubit extends Cubit<TodoState> {
  final DatabaseHelper _databaseHelper;

  TodoCubit(this._databaseHelper) : super(const TodoState([])) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todos = await _databaseHelper.getTodos();
    emit(TodoState(todos));
  }

  Future<void> addTodo(String title) async {
    final newTodo = {'title': title, 'isComplete': 0};
    await _databaseHelper.insertTodo(newTodo);
    loadTodos();
  }

  Future<void> updateTodo(int id, bool isComplete) async {
    final updatedTodo = {'id': id, 'isComplete': isComplete ? 1 : 0};
    await _databaseHelper.updateTodo(updatedTodo);
    loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _databaseHelper.deleteTodo(id);
    loadTodos();
  }
}
