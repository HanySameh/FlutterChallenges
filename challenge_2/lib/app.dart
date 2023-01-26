import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Pice Blog Challenge',
      theme: AppTheme.lightTheme,
      home: null,
    );
  }
}
