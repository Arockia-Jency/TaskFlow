import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkLoginStatus() async {

    emit(SplashLoading());

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final prefs = await SharedPreferences.getInstance();

    final isLoggedIn =
        prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      emit(NavigateToHome());
    } else {
      emit(NavigateToLogin());
    }
  }

}