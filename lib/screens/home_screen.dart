import 'package:flutter/material.dart';
import '../repository/task_repository.dart';
import '../blocs/task_bloc.dart';
import '../models/task_model.dart';

class HomeScreen extends StatefulWidget {
  final TaskRepository taskRepository;

  const HomeScreen({super.key, required this.taskRepository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TaskBloc _taskBloc;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskBloc = TaskBloc(widget.taskRepository);
    _taskBloc.fetchTasks();
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Add Task'),
            content: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter task title'),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  final title = _controller.text.trim();
                  if (title.isNotEmpty) {
                    await _taskBloc.addTask(title);
                    _controller.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: RefreshIndicator(
        onRefresh: _taskBloc.fetchTasks,
        child: AnimatedBuilder(
          animation: _taskBloc,
          builder: (_, __) {
            final tasks = _taskBloc.tasks;
            if (tasks.isEmpty) {
              return const Center(child: Text('No tasks yet.'));
            }
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                final task = tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (_) => _taskBloc.toggleTask(task),
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _taskBloc.deleteTask(task),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
