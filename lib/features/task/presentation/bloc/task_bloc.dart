import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {

    on<LoadTasks>((event, emit) {
      emit(TaskLoaded([]));
    });

    on<AddTask>((event, emit) {
      final currentState = state;

      if (currentState is TaskLoaded) {
        final updatedTasks = [
          ...currentState.tasks,
          TaskModel(
            id: DateTime.now().toString(),
            title: event.title,
            isCompleted: false,
          ),
        ];

        emit(TaskLoaded(updatedTasks));
      }
    });

    on<UpdateTask>((event, emit) {
      final currentState = state;

      if (currentState is TaskLoaded) {
        final updatedTasks = currentState.tasks.map((task) {

          if (task.id == event.id) {
            return task.copyWith(
              title: event.title,
            );
          }

          return task;

        }).toList();

        emit(TaskLoaded(updatedTasks));
      }
    });


    on<DeleteTask>((event, emit) {
      final currentState = state;

      if (currentState is TaskLoaded) {
        final updatedTasks = currentState.tasks
            .where((task) => task.id != event.id)
            .toList();

        emit(TaskLoaded(updatedTasks));
      }
    });

    on<ToggleTask>((event, emit) {
      print("Toggle task: ${event.id}");

      final currentState = state;

      if (currentState is TaskLoaded) {
        final updatedTasks = currentState.tasks.map((task) {

          if (task.id == event.id) {
            return task.copyWith(
              isCompleted: !task.isCompleted,
            );
          }

          return task;
        }).toList();

        emit(TaskLoaded(updatedTasks));
      }
    });

  }
}