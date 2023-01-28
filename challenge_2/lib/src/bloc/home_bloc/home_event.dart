import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app_routes.dart';
import '../../data/local/app_data_source.dart';
import '../../data/models/category_model.dart';
import '../../data/models/post_model.dart';
import '../../data/models/story_model.dart';
import 'home_bloc.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final List<PostModel> _posts;

  late final List<StoryModel> _stories;

  late final List<CategoryModel> _categories;

  late final AppDataSource _appDataSource;

  HomeBloc({required AppDataSource appDataSource})
      : _appDataSource = appDataSource,
        super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeSliderPageChange>(_onSliderPageChanged);
    on<HomeNavigateTo>(_onNavigateTo);
  }

  _onSliderPageChanged(HomeSliderPageChange event, Emitter<HomeState> emit) {
    if (state.status == HomeStatus.success) {
      emit(state.copyWith(
          currentIndex: event.currentIndex, status: HomeStatus.success));
    }
  }

  _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _posts = _appDataSource.posts;
      _stories = _appDataSource.stories;
      _categories = _appDataSource.categories;
    });
    emit(
      HomeState(
        status: HomeStatus.success,
        stories: _stories,
        posts: _posts,
        categories: _categories,
      ),
    );
  }

  _onNavigateTo(HomeNavigateTo event, Emitter<HomeState> emit) {
    Navigator.of(event.context).push(
      AppRoutes.generateRoute(
        const RouteSettings(
          name: AppRoutes.kArticleScreenRoute,
        ),
      ),
    );
  }
}
