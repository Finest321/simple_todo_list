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

  void _showDeleteConfirmationDialog(Task task) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: Text(
              'Are you sure you want to delete the task "${task.title}"?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _taskBloc.deleteTask(task);
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          ),
    );
  }

  Widget _buildGroupedTasks(List<Task> tasks) {
    tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final Map<String, List<Task>> groupedTasks = {};
    for (var task in tasks) {
      final now = DateTime.now();
      final isToday =
          task.createdAt.year == now.year &&
          task.createdAt.month == now.month &&
          task.createdAt.day == now.day;

      final key =
          isToday
              ? 'Recent'
              : '${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}';

      groupedTasks.putIfAbsent(key, () => []).add(task);
    }

    return ListView(
      children:
          groupedTasks.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...entry.value.map(
                  (task) => ListTile(
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (_) => _taskBloc.toggleTask(task),
                    ),
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _showDeleteConfirmationDialog(task),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
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
            return _buildGroupedTasks(tasks);
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
