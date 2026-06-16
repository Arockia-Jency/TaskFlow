import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flow_manager/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {

    emit(AuthLoading());

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (email == "jency@gmail.com" && password == "123456") {
      emit(AuthAuthenticated());

    }else {
      emit(AuthError("Invalid Credentials"));
    }
  }

  void logout() {
    emit(AuthUnauthenticated());
  }

}