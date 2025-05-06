import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
  final taskCollection = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(String title) async {
    await taskCollection.add({'title': title, 'isDone': false});
  }

  Future<void> deleteTask(Task task) async {
    await taskCollection.doc(task.id).delete();
  }

  Future<void> toggleTask(Task task) async {
    await taskCollection.doc(task.id).update({'isDone': !task.isDone});
  }

  Future<List<Task>> fetchTasks() async {
    final snapshot = await taskCollection.get();
    return snapshot.docs
        .map((doc) => Task.fromMap(doc.data(), doc.id))
        .toList();
  }
}
