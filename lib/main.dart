import 'package:flutter/material.dart';
import 'package:task_flow_manager/core/themes.dart';

void main() => runApp(
    MaterialApp(
      title: "Task flow",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: TaskFlowApp(),
    )
);

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Task Flow"),
      ),

    );
  }
}
