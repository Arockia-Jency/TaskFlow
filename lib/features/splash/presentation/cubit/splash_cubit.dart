import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkLoginStatus() async {
    emit(SplashLoading());

    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Temporary logic
    bool isLoggedIn = false;

    if (isLoggedIn) {
       emit(NavigateToHome());
    } else {
      emit(NavigateToLogin());
    }
  }
}