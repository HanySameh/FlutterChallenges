import 'package:equatable/equatable.dart';

enum AuthMode { login, signUp }

class AuthState extends Equatable {
  final AuthMode authMode;
  final bool isObscure;
  final bool isLoading;

  const AuthState({
    required this.authMode,
    this.isObscure = true,
    this.isLoading = false,
  });

  AuthState copyWith({AuthMode? authMode, bool? isObscure, bool? isLoading}) {
    return AuthState(
      authMode: authMode ?? this.authMode,
      isObscure: isObscure ?? this.isObscure,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [authMode, isObscure, isLoading];
}
