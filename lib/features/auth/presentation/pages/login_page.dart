import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: .all(16),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Success"))
                );
              }
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message))
                );
              }

            }, builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                ),

                const SizedBox(height: 16.0),

                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),

                const SizedBox(height: 20.0),

                ElevatedButton(
                    onPressed: (){
                      context.read<AuthCubit>().login(
                          emailController.text,
                          passwordController.text
                      );
                    },
                    child: state is AuthLoading ?
                    const CircularProgressIndicator() : const Text('login'),


                )
              ],
            );
          },
          ),
        )
    );
  }
}
