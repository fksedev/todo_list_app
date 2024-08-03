import 'package:equatable/equatable.dart';


// State definition
class TodoState extends Equatable {
  final List<Map<String, dynamic>> todos;

  const TodoState(this.todos);

  @override
  List<Object?> get props => [todos];
}

// Events definition
abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  AddTodo(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateTodo extends TodoEvent {
  final int id;
  final bool isComplete;

  UpdateTodo(this.id, this.isComplete);

  @override
  List<Object?> get props => [id, isComplete];
}

class DeleteTodo extends TodoEvent {
  final int id;

  DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];
}