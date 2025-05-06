import '../models/task_model.dart';
import '../repository/task_repository.dart';
import 'package:flutter/material.dart';

class TaskBloc extends ChangeNotifier {
  final TaskRepository taskRepository;
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskBloc(this.taskRepository);

  Future<void> fetchTasks() async {
    _tasks = await taskRepository.fetchTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    await taskRepository.addTask(title);
    await fetchTasks();
  }

  Future<void> deleteTask(Task task) async {
    await taskRepository.deleteTask(task);
    await fetchTasks();
  }

  Future<void> toggleTask(Task task) async {
    await taskRepository.toggleTask(task);
    await fetchTasks();
  }
}
