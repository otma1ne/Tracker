import 'package:tracker/enums/project_status.dart';
import 'package:tracker/enums/task_status.dart';
import 'package:tracker/models/task.dart';

class Project {
  final String id;
  final String userId;
  final String name;
  final String description;
  final String color;
  final ProjectStatus status;
  final DateTime createdAt;
  final DateTime? dueDate;
  final List<Task> tasks;

  Project({
    required this.id,
    required this.userId,
    required this.name,
    this.description = '',
    required this.color,
    this.status = ProjectStatus.active,
    required this.createdAt,
    this.dueDate,
    this.tasks = const [],
  });

  int get completedTasksCount => tasks.where((t) => t.status == TaskStatus.done).length;
  int get totalTasksCount => tasks.length;
  double get progress => totalTasksCount == 0 ? 0 : completedTasksCount / totalTasksCount;

  Project copyWith({
    String? id,
    String? userId,
    String? name,
    String? description,
    String? color,
    ProjectStatus? status,
    DateTime? createdAt,
    DateTime? dueDate,
    List<Task>? tasks,
  }) {
    return Project(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'color': color,
      'status': status.toString(),
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'tasks': tasks.map((t) => t.toJson()).toList(),
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'] ?? '',
      color: json['color'],
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => ProjectStatus.active,
      ),
      createdAt: DateTime.parse(json['createdAt']),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      tasks: (json['tasks'] as List?)?.map((t) => Task.fromJson(t)).toList() ?? [],
    );
  }
}
