import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/splash/presentation/cubit/splash_cubit.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'core/themes.dart';
import 'features/task/presentation/bloc/task_bloc.dart';
import 'features/task/presentation/bloc/task_event.dart';

void main() {
  runApp(
   MultiBlocProvider(
       providers: [
         BlocProvider(
           create: (_) => SplashCubit(),
         ),
         BlocProvider(
           create: (_) => AuthCubit(),
         ),
         BlocProvider(
           create: (_) => TaskBloc()
             ..add(LoadTasks()),
         ),

       ],
       child: const TaskFlowApp())
  );
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Flow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashPage(),
    );
  }
}