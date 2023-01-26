import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String label;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? autoCorrect;
  final bool? enableSuggestions;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;

  const AuthFormField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.label,
    this.suffixIcon,
    this.obscureText,
    this.autoCorrect,
    this.enableSuggestions,
    this.inputFormatters,
    this.keyboardType,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon: suffixIcon,
      ),
      autocorrect: autoCorrect ?? true,
      enableSuggestions: enableSuggestions ?? true,
      obscureText: obscureText ?? false,
    );
  }
}
