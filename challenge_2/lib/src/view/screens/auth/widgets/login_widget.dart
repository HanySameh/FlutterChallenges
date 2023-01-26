import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../bloc/auth_bloc/auth_state.dart';
import '../../../../configs/app_theme.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.state,
    required this.usernameTextField,
    required this.passwordTextField,
    required this.authRequestButton,
  });
  final AuthState state;
  final Widget usernameTextField;
  final Widget passwordTextField;
  final Widget authRequestButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Sign in with your account',
          style: AppTheme.lightTheme.textTheme.titleMedium!
              .apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        usernameTextField,
        const SizedBox(
          height: 8,
        ),
        passwordTextField,
        const SizedBox(height: 24),
        authRequestButton,
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text.rich(
            TextSpan(text: 'Forget your password?', children: [
              TextSpan(
                text: ' Reset here',
                style: TextStyle(
                    color: AppTheme.lightTheme.colorScheme.primary,
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              Assets.img.icons.twitter.image(width: 36, height: 36),
            ],
          ),
        )
      ],
    );
  }
}
