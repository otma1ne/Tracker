import 'package:tracker/models/project.dart';
import 'package:tracker/models/task.dart';
import 'package:tracker/services/storage_service.dart';

class ProjectService {
  final StorageService _storage = StorageService();
  static const String _projectsKey = 'projects';

  // Get all projects for current user
  List<Project> getAllProjects() {
    final userId = _storage.getUserId();
    if (userId == null) return [];

    final projectsJson = _storage.read<List>(_projectsKey) ?? [];
    final allProjects = projectsJson.map((json) => Project.fromJson(json)).toList();

    return allProjects.where((p) => p.userId == userId).toList();
  }

  // Get project by ID
  Project? getProjectById(String id) {
    return getAllProjects().where((p) => p.id == id).firstOrNull;
  }

  // Save project
  Future<void> saveProject(Project project) async {
    final projects = getAllProjects();
    final index = projects.indexWhere((p) => p.id == project.id);

    if (index >= 0) {
      projects[index] = project;
    } else {
      projects.add(project);
    }

    await _saveAll(projects);
  }

  // Delete project
  Future<void> deleteProject(String id) async {
    final projects = getAllProjects();
    projects.removeWhere((p) => p.id == id);
    await _saveAll(projects);
  }

  // Task operations
  Future<void> addTaskToProject(String projectId, Task task) async {
    final project = getProjectById(projectId);
    if (project == null) return;

    final updatedProject = project.copyWith(
      tasks: [...project.tasks, task],
    );

    await saveProject(updatedProject);
  }

  Future<void> updateTask(String projectId, Task task) async {
    final project = getProjectById(projectId);
    if (project == null) return;

    final tasks = project.tasks.map((t) => t.id == task.id ? task : t).toList();
    final updatedProject = project.copyWith(tasks: tasks);

    await saveProject(updatedProject);
  }

  Future<void> deleteTask(String projectId, String taskId) async {
    final project = getProjectById(projectId);
    if (project == null) return;

    final tasks = project.tasks.where((t) => t.id != taskId).toList();
    final updatedProject = project.copyWith(tasks: tasks);

    await saveProject(updatedProject);
  }

  // Private helper
  Future<void> _saveAll(List<Project> projects) async {
    await _storage.write(_projectsKey, projects.map((p) => p.toJson()).toList());
  }
}
