import 'package:tracker/enums/project_status.dart';
import 'package:tracker/enums/task_status.dart';
import 'package:tracker/models/project.dart';
import 'package:tracker/models/task.dart';
import 'package:tracker/services/project_service.dart';

class ProjectRepository {
  final ProjectService _projectService = ProjectService();

  // Projects
  List<Project> getProjects() => _projectService.getAllProjects();

  Project? getProject(String id) => _projectService.getProjectById(id);

  Future<void> createProject(Project project) => _projectService.saveProject(project);

  Future<void> updateProject(Project project) => _projectService.saveProject(project);

  Future<void> deleteProject(String id) => _projectService.deleteProject(id);

  // Tasks
  Future<void> createTask(String projectId, Task task) =>
      _projectService.addTaskToProject(projectId, task);

  Future<void> updateTask(String projectId, Task task) =>
      _projectService.updateTask(projectId, task);

  Future<void> deleteTask(String projectId, String taskId) =>
      _projectService.deleteTask(projectId, taskId);

  // Queries
  List<Project> getActiveProjects() {
    return getProjects().where((p) => p.status == ProjectStatus.active).toList();
  }

  List<Project> getCompletedProjects() {
    return getProjects().where((p) => p.status == ProjectStatus.completed).toList();
  }

  List<Task> getInProgressTasks() {
    return getProjects()
        .expand((p) => p.tasks)
        .where((t) => t.status == TaskStatus.inProgress)
        .toList();
  }
}
