import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final bool isDone;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.createdAt,
    this.isDone = false,
  });

  factory Task.fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map['title'],
      isDone: map['isDone'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

