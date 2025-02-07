import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

enum FilterTask { all, completed, pending }

class Taskproviders extends ChangeNotifier {
  final List<Task> _task = [];

  // ignore: recursive_getters
  // List<Task> get task => _task;

  FilterTask _filter = FilterTask.all;

  List<Task> get task {
    switch (_filter) {
      case FilterTask.completed:
        return _task.where((task) => task.isCompleted).toList();
      case FilterTask.pending:
        return _task.where((task) => !task.isCompleted).toList();
      default:
        return _task;
    }
  }

  FilterTask get filter => _filter;

  void setFilter(FilterTask filter) {
    _filter = filter;
    notifyListeners();
  }

  void addTask(String title, String category) {
    final newTask =
        Task(id: DateTime.now().toString(), title: title, category: category);
    _task.add(newTask);
    notifyListeners();
  }

  void toggleChangeStatus(String id) {
    final taskIndex = _task.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _task[taskIndex].isCompleted = !_task[taskIndex].isCompleted;
      notifyListeners();
    }
  }

  void editTask(String id, String newtitle, String newcategory) {
    final takIndex = _task.indexWhere((task) => task.id == id);
    if (takIndex != -1) {
      _task[takIndex] = Task(
          id: id,
          title: newtitle,
          category: newcategory,
          isCompleted: _task[takIndex].isCompleted);
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _task.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
