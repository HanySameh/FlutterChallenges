import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileEvent extends Equatable {}

class ProfileStarted extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileScrolled extends ProfileEvent {
  final bool _isScrolled;
  bool get isScrolled => _isScrolled;

  ProfileScrolled({
    required bool isScrolled,
  }) : _isScrolled = isScrolled;

  @override
  List<Object> get props => [_isScrolled];
}

class ProfilePostsButtonClicked extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileFollowingButtonClicked extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileFollowersButtonClicked extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileNavigateTo extends ProfileEvent {
  final BuildContext context;
  ProfileNavigateTo({required this.context});

  @override
  List<Object?> get props => [];
}
