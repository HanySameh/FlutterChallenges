import 'package:challenge_2/src/bloc/on_boarding_bloc/on_boarding_bloc.dart';
import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/bloc/article_bloc/article_bloc.dart';
import 'src/bloc/auth_bloc/auth_bloc.dart';
import 'src/bloc/home_bloc/home_event.dart';
import 'src/bloc/profile_bloc/profile_bloc.dart';
import 'src/bloc/splash_bloc/splash_bloc.dart';
import 'src/configs/app_routes.dart';
import 'src/data/local/app_data_source.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppDataSource(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => SplashBloc(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => OnBoardingBloc(
            appDataSource: RepositoryProvider.of<AppDataSource>(context),
          ),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => AuthBloc(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => HomeBloc(
            appDataSource: RepositoryProvider.of<AppDataSource>(context),
          ),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => ArticleBloc(
            appDataSource: RepositoryProvider.of<AppDataSource>(context),
          ),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => ProfileBloc(
            appDataSource: RepositoryProvider.of<AppDataSource>(context),
          ),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Blog Club Challenge',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.kSplashRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
