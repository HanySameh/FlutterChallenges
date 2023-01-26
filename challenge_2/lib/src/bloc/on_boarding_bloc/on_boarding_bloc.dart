import 'package:challenge_2/src/data/local/app_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app_routes.dart';
import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final AppDataSource _appDataSource;

  OnBoardingBloc({
    required AppDataSource appDataSource,
  })  : _appDataSource = appDataSource,
        super(
          const OnBoardingState(onBoardingItems: [], isReachedMaxPage: false),
        ) {
    on<OnBoardingStarted>(_onStarted);
    on<OnBoardingPageChanged>(_onPageChanged);
    on<OnBoardingNavigateTo>(_onNavigateTo);
  }

  _onStarted(OnBoardingStarted event, Emitter<OnBoardingState> emit) {
    emit(state.copyWith(onBoardingItems: _appDataSource.onBoardingItems));
  }

  _onNavigateTo(OnBoardingNavigateTo event, Emitter<OnBoardingState> emit) {
    if (_isReachedMaxPageCheck(event.pageController)) {
      Navigator.pushReplacementNamed(event.context, AppRoutes.kAuthScreenRoute);
    }
    event.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  bool _isReachedMaxPageCheck(PageController pageController) =>
      (pageController.hasClients &&
          (pageController.page!.round() == state.onBoardingItems.length - 1));

  _onPageChanged(OnBoardingPageChanged event, Emitter<OnBoardingState> emit) {
    if (_isReachedMaxPageCheck(event.pageController)) {
      emit(state.copyWith(isReachedMaxPage: true));
    } else {
      emit(state.copyWith(isReachedMaxPage: false));
    }
  }
}
