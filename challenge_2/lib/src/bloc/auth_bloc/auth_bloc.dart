import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app_routes.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late GlobalKey<FormState> formKey;

  AuthBloc()
      : super(
          const AuthState(
            authMode: AuthMode.login,
            isLoading: false,
          ),
        ) {
    formKey = GlobalKey();
    on<AuthObscurePassword>(_onObscurePassword);
    on<AuthModeChanged>(_onModeChanged);
    on<AuthRequested>(_onRequested);
  }

  _onRequested(AuthRequested event, Emitter<AuthState> emit) {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(isLoading: true));

      if (state.authMode == AuthMode.login) {
        debugPrint('Login..');
      } else {
        debugPrint('SignUp..');
      }
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacementNamed(
          event.context,
          AppRoutes.kMainScreenRoute,
        ),
      );
    }
  }

  _onObscurePassword(AuthObscurePassword event, Emitter<AuthState> emit) {
    emit(state.copyWith(isObscure: !event.isObscure));
  }

  _onModeChanged(AuthModeChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        authMode:
            state.authMode == AuthMode.login ? AuthMode.signUp : AuthMode.login,
        isObscure: true,
      ),
    );
  }
}
