import 'package:equatable/equatable.dart';

import '../../data/models/on_boarding_model.dart';

class OnBoardingState extends Equatable {
  final List<OnBoardingModel> onBoardingItems;
  final bool isReachedMaxPage;

  @override
  List<Object?> get props => [onBoardingItems, isReachedMaxPage];

  const OnBoardingState({
    required this.onBoardingItems,
    required this.isReachedMaxPage,
  });

  OnBoardingState copyWith({
    List<OnBoardingModel>? onBoardingItems,
    bool? isReachedMaxPage,
  }) {
    return OnBoardingState(
      onBoardingItems: onBoardingItems ?? this.onBoardingItems,
      isReachedMaxPage: isReachedMaxPage ?? this.isReachedMaxPage,
    );
  }
}
