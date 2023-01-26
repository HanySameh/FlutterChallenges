import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../bloc/auth_bloc/auth_state.dart';

class ModesButton extends StatelessWidget {
  const ModesButton({
    super.key,
    required this.signUpOnTap,
    required this.logInOnTap,
    required this.state,
  });
  final VoidCallback signUpOnTap;
  final VoidCallback logInOnTap;
  final AuthState state;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: logInOnTap,
          child: Text(
            'log in'.toUpperCase(),
            style: AppTheme.lightTheme.textTheme.titleLarge!.apply(
              color: state.authMode == AuthMode.login
                  ? ColorName.white
                  : ColorName.white.withOpacity(0.2),
            ),
          ),
        ),
        InkWell(
          onTap: signUpOnTap,
          child: Text(
            'sign up'.toUpperCase(),
            style: AppTheme.lightTheme.textTheme.titleLarge!.apply(
              color: state.authMode == AuthMode.signUp
                  ? ColorName.white
                  : ColorName.white.withOpacity(0.2),
            ),
          ),
        )
      ],
    );
  }
}
