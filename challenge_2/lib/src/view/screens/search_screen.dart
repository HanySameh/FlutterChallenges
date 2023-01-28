import 'package:flutter/material.dart';

import '../../configs/app_theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
