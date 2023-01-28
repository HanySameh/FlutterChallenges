import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/app_data_source.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final AppDataSource _appDataSource;

  ArticleBloc({
    required AppDataSource appDataSource,
  })  : _appDataSource = appDataSource,
        super(ArticleLoading()) {
    on<ArticleStarted>(_onStarted);
    on<ArticleScrolled>(_onScrolled);
    on<ArticleNavigateToBack>(_onNavigateToBack);
  }

  _onStarted(ArticleStarted event, Emitter<ArticleState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(ArticleSuccess(article: _appDataSource.article));
  }

  _onScrolled(ArticleScrolled event, Emitter<ArticleState> emit) {
    emit((state as ArticleSuccess).copyWith(isScrolled: event.isScrolled));
  }

  _onNavigateToBack(ArticleNavigateToBack event, Emitter<ArticleState> emit) {}
}
