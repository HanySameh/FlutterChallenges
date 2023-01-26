import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthRequested extends AuthEvent {
  final BuildContext context;
  final String username;
  final String? fullName;
  final String password;

  AuthRequested({
    required this.context,
    required this.username,
    required this.password,
    this.fullName,
  });
}

class AuthObscurePassword extends AuthEvent {
  final bool isObscure;

  AuthObscurePassword({required this.isObscure});
}

class AuthModeChanged extends AuthEvent {}
