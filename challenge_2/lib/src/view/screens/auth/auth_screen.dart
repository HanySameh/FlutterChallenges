import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:challenge_2/src/view/screens/auth/widgets/auth_form_field.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../bloc/auth_bloc/auth_event.dart';
import '../../../bloc/auth_bloc/auth_state.dart';
import '../../../configs/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/util/validators.dart';
import '../../widgets/button_widget.dart';
import 'widgets/login_widget.dart';
import 'widgets/logo_widget.dart';
import 'widgets/modes_buttons.dart';
import 'widgets/sign_up_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _fullNameController;
  late final FocusNode _usernameFocus;
  late final FocusNode _passwordFocus;
  late final FocusNode _fullNameFocus;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _fullNameController = TextEditingController();
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
    _fullNameFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _usernameFocus.dispose();
    _fullNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>
          RepositoryProvider.of<AuthBloc>(context),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const LogoWidget(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightTheme.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 68,
                            child: ModesButton(
                              state: state,
                              signUpOnTap: () {
                                context.read<AuthBloc>().add(AuthModeChanged());
                                _userNameController.clear();
                                _passwordController.clear();
                                _fullNameController.clear();
                                _usernameFocus.unfocus();
                                context
                                    .read<AuthBloc>()
                                    .formKey
                                    .currentState!
                                    .reset();
                              },
                              logInOnTap: () {
                                context.read<AuthBloc>().add(AuthModeChanged());
                                _userNameController.clear();
                                _passwordController.clear();
                                _fullNameFocus.unfocus();
                                context
                                    .read<AuthBloc>()
                                    .formKey
                                    .currentState!
                                    .reset();
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: AppTheme.lightTheme.colorScheme.surface,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32),
                                  topLeft: Radius.circular(32),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Form(
                                    key: context.read<AuthBloc>().formKey,
                                    child: state.authMode == AuthMode.login
                                        ? LoginWidget(
                                            state: state,
                                            usernameTextField:
                                                _usernameFormField(context),
                                            passwordTextField:
                                                _passwordFormField(
                                                    context, state),
                                            authRequestButton:
                                                _authRequestButton(
                                                    context, state),
                                          )
                                        : SignUpWidget(
                                            state: state,
                                            usernameTextField:
                                                _usernameFormField(context),
                                            passwordTextField:
                                                _passwordFormField(
                                                    context, state),
                                            authRequestButton:
                                                _authRequestButton(
                                                    context, state),
                                            fullNameController:
                                                _fullNameController,
                                            fullNameFocus: _fullNameFocus,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authRequestButton(BuildContext context, AuthState state) {
    return ButtonWidget(
      width: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: state.isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppTheme.lightTheme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text((state.authMode == AuthMode.login ? 'log in' : 'sign up')
                    .toUpperCase())
              ],
            )
          : Text((state.authMode == AuthMode.login ? 'log in' : 'sign up')
              .toUpperCase()),
      voidCallback: () {
        context.read<AuthBloc>().add(
              AuthRequested(
                context: context,
                username: _userNameController.text,
                password: _passwordController.text,
                fullName: state.authMode == AuthMode.signUp
                    ? _fullNameController.text
                    : null,
              ),
            );
      },
    );
  }

  Widget _usernameFormField(BuildContext context) {
    return AuthFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(AppConstants.spaceRegex),
      ],
      validator: Validator.emailValidator,
      focusNode: _usernameFocus,
      keyboardType: TextInputType.emailAddress,
      controller: _userNameController,
      onEditingComplete: () {
        _usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      onFieldSubmitted: (term) {
        _usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      label: 'Username',
    );
  }

  Widget _passwordFormField(BuildContext context, AuthState state) {
    return AuthFormField(
      validator: Validator.passwordValidator,
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      label: 'password',
      suffixIcon: TextButton(
        onPressed: () {
          context
              .read<AuthBloc>()
              .add(AuthObscurePassword(isObscure: state.isObscure));
        },
        child: state.isObscure ? const Text('Show') : const Text('Hide'),
      ),
      obscureText: state.isObscure,
      autoCorrect: false,
      enableSuggestions: false,
    );
  }
}
