import 'package:get/get.dart';
import 'package:tracker/data/repositories/project_repository.dart';
import 'package:tracker/models/project.dart';
import 'package:tracker/models/task.dart';

class ProjectController extends GetxController {
  final ProjectRepository _repository = ProjectRepository();

  final RxList<Project> projects = <Project>[].obs;
  final Rx<Project?> selectedProject = Rx<Project?>(null);

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void loadProjects() {
    projects.value = _repository.getProjects();
  }

  List<Project> get activeProjects => _repository.getActiveProjects();
  List<Project> get completedProjects => _repository.getCompletedProjects();
  List<Task> get inProgressTasks => _repository.getInProgressTasks();

  Future<void> createProject(Project project) async {
    await _repository.createProject(project);
    loadProjects();
  }

  Future<void> updateProject(Project project) async {
    await _repository.updateProject(project);
    loadProjects();
    if (selectedProject.value?.id == project.id) {
      selectedProject.value = project;
    }
  }

  Future<void> deleteProject(String id) async {
    await _repository.deleteProject(id);
    loadProjects();
    if (selectedProject.value?.id == id) {
      selectedProject.value = null;
    }
  }

  void selectProject(String id) {
    selectedProject.value = _repository.getProject(id);
  }

  Future<void> createTask(String projectId, Task task) async {
    await _repository.createTask(projectId, task);
    loadProjects();
    selectProject(projectId);
  }

  Future<void> updateTask(String projectId, Task task) async {
    await _repository.updateTask(projectId, task);
    loadProjects();
    selectProject(projectId);
  }

  Future<void> deleteTask(String projectId, String taskId) async {
    await _repository.deleteTask(projectId, taskId);
    loadProjects();
    selectProject(projectId);
  }
}
