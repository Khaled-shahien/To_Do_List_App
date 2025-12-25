import 'package:to_do_list_app/features/todo/domain/entities/todo_item.dart';
import 'package:to_do_list_app/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final List<ToDoItem> _todoItems = [];

  @override
  List<ToDoItem> getTodos() {
    return _todoItems;
  }

  @override
  void addTodo(ToDoItem todo) {
    _todoItems.add(todo);
  }

  @override
  void updateTodo(int index, ToDoItem todo) {
    if (index >= 0 && index < _todoItems.length) {
      _todoItems[index] = todo;
    }
  }

  @override
  void deleteTodo(int index) {
    if (index >= 0 && index < _todoItems.length) {
      _todoItems.removeAt(index);
    }
  }

  @override
  void toggleTodo(int index) {
    if (index >= 0 && index < _todoItems.length) {
      _todoItems[index].isCompleted = !_todoItems[index].isCompleted;
    }
  }
}
