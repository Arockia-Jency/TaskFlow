import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../task/presentation/bloc/task_bloc.dart';
import '../../../task/presentation/bloc/task_event.dart';
import '../../../task/presentation/bloc/task_state.dart';
import '../../../task/presentation/widgets/add_task_dialog.dart';
import '../../../task/presentation/widgets/edit_task_dialog.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Flow"),
      ),

      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {

          if (state is TaskLoaded) {

            if (state.tasks.isEmpty) {
              return const Center(
                child: Text("No Tasks"),
              );
            }

            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {

                final task = state.tasks[index];

                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      context.read<TaskBloc>().add(
                        ToggleTask(task.id),
                      );
                    },
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          final updatedTitle =
                          await showDialog<String>(
                            context: context,
                            builder: (_) => EditTaskDialog(
                              initialTitle: task.title,
                            ),
                          );

                          if (updatedTitle != null &&
                              updatedTitle.isNotEmpty) {
                            context.read<TaskBloc>().add(
                              UpdateTask(
                                id: task.id,
                                title: updatedTitle,
                              ),
                            );
                          }
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TaskBloc>().add(
                            DeleteTask(task.id),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          final title = await showDialog<String>(
            context: context,
            builder: (_) => const AddTaskDialog(),
          );

          if (title != null && title.isNotEmpty) {
            context.read<TaskBloc>().add(
              AddTask(title),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}