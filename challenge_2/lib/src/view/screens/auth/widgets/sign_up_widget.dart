import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../bloc/auth_bloc/auth_state.dart';
import '../../../../core/util/validators.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
    required this.state,
    required this.usernameTextField,
    required this.passwordTextField,
    required this.authRequestButton,
    required this.fullNameFocus,
    required this.fullNameController,
  });
  final AuthState state;
  final Widget usernameTextField;
  final Widget passwordTextField;
  final Widget authRequestButton;
  final FocusNode fullNameFocus;
  final TextEditingController fullNameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Blog Club',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Enter your information',
          style: AppTheme.lightTheme.textTheme.titleMedium!
              .apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: Validator.nameValidator,
          focusNode: fullNameFocus,
          autocorrect: true,
          controller: fullNameController,
          decoration: const InputDecoration(
            label: Text('Full Name'),
          ),
        ),
        usernameTextField,
        const SizedBox(
          height: 8,
        ),
        passwordTextField,
        const SizedBox(height: 24),
        authRequestButton,
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
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
