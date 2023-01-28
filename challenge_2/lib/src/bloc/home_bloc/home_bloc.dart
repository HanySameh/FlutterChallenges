import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeSliderPageChange extends HomeEvent {
  final int _currentIndex;

  int get currentIndex => _currentIndex;

  const HomeSliderPageChange({
    required int index,
  }) : _currentIndex = index;

  @override
  List<Object> get props => [_currentIndex];
}

class HomeNavigateTo extends HomeEvent {
  final BuildContext context;
  const HomeNavigateTo({
    required this.context,
  });
}
