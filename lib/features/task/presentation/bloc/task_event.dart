abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final String title;

  AddTask(this.title);
}

class DeleteTask extends TaskEvent {
  final String id;

  DeleteTask(this.id);
}

class UpdateTask extends TaskEvent {
  final String id;
  final String title;

  UpdateTask({
    required this.id,
    required this.title,
  });
}

class ToggleTask extends TaskEvent {
  final String id;

  ToggleTask(this.id);
}