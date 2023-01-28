import 'package:equatable/equatable.dart';

import '../../data/models/category_model.dart';
import '../../data/models/post_model.dart';
import '../../data/models/story_model.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;

  final List<PostModel> posts;

  final List<StoryModel> stories;

  final List<CategoryModel> categories;

  final int currentIndex;

  const HomeState({
    this.stories = const <StoryModel>[],
    this.posts = const <PostModel>[],
    this.categories = const <CategoryModel>[],
    this.status = HomeStatus.loading,
    this.currentIndex = 0,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<PostModel>? posts,
    List<StoryModel>? stories,
    List<CategoryModel>? categories,
    int currentIndex = 0,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      stories: stories ?? this.stories,
      categories: categories ?? this.categories,
      currentIndex: currentIndex != 0 ? currentIndex : this.currentIndex,
    );
  }

  @override
  List<Object> get props => [status, stories, categories, posts, currentIndex];
}
