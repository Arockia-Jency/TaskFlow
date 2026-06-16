import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flow_manager/features/auth/presentation/pages/home_page.dart';
import 'package:task_flow_manager/features/auth/presentation/pages/login_page.dart';
import 'package:task_flow_manager/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:task_flow_manager/features/splash/presentation/cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashCubit>().checkLoginStatus();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      listener: (context, state) {
        if (state is NavigateToLogin) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => LoginPage())
          );
        }
        if (state is NavigateToHome) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) =>const  HomePage())
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: FlutterLogo(size: 250),
        ),
      ),
    );
  }
}
