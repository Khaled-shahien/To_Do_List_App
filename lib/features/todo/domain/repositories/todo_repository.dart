import 'package:to_do_list_app/features/todo/domain/entities/todo_item.dart';

abstract class TodoRepository {
  List<ToDoItem> getTodos();
  void addTodo(ToDoItem todo);
  void updateTodo(int index, ToDoItem todo);
  void deleteTodo(int index);
  void toggleTodo(int index);
}
