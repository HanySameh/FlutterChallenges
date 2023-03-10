import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  final ArticleModel article;
  late final bool isScrolled;

  ArticleSuccess({
    required this.article,
    bool? isScrolled,
  }) : isScrolled = isScrolled ?? false;

  ArticleState copyWith({
    ArticleModel? article,
    bool? isScrolled,
  }) {
    return ArticleSuccess(
      article: article ?? this.article,
      isScrolled: isScrolled ?? this.isScrolled,
    );
  }

  @override
  List<Object> get props => [isScrolled];
}
