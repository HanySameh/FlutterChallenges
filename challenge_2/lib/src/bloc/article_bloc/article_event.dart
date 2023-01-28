import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ArticleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticleStarted extends ArticleEvent {}

class ArticleNavigateToBack extends ArticleEvent {
  final BuildContext context;

  ArticleNavigateToBack({required this.context});
}

class ArticleScrolled extends ArticleEvent {
  final bool _isScrolled;
  bool get isScrolled => _isScrolled;

  ArticleScrolled({
    required bool isScrolled,
  }) : _isScrolled = isScrolled;

  @override
  List<Object> get props => [_isScrolled];
}
