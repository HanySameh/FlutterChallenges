import 'package:challenge_2/src/bloc/splash_bloc/splash_event.dart';
import 'package:challenge_2/src/bloc/splash_bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app_routes.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<NavigateToEvent>(_onNavigateTo);
  }
  _onNavigateTo(NavigateToEvent event, Emitter<SplashState> emit) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(
        event.context,
        AppRoutes.kOnBoardingScreenRoute,
      ),
    );
  }
}
