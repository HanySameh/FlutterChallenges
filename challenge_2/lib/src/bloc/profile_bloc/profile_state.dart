import 'package:equatable/equatable.dart';

import '../../data/models/profile_model.dart';

abstract class ProfileState extends Equatable {}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccess extends ProfileState {
  late final ProfileModel _profileModel;

  ProfileModel get profileModel => _profileModel;

  late final bool isPostsClicked;
  late final bool isFollowingClicked;
  late final bool isFollowersClicked;
  late final bool isScrolled;

  ProfileSuccess({
    required ProfileModel profileModel,
    bool? isPostsClicked,
    bool? isFollowingClicked,
    bool? isFollowersClicked,
    bool? isScrolled,
  }) {
    _profileModel = profileModel;
    this.isPostsClicked = isPostsClicked ?? true;
    this.isFollowingClicked = isFollowingClicked ?? false;
    this.isFollowersClicked = isFollowersClicked ?? false;
    this.isScrolled = isScrolled ?? false;
  }

  ProfileState copyWith({
    ProfileModel? profileModel,
    bool? isPostsClicked,
    bool? isFollowingClicked,
    bool? isFollowersClicked,
    bool? isScrolled,
  }) {
    return ProfileSuccess(
      profileModel: profileModel ?? _profileModel,
      isPostsClicked: isPostsClicked ?? this.isPostsClicked,
      isFollowingClicked: isFollowingClicked ?? this.isFollowingClicked,
      isFollowersClicked: isFollowersClicked ?? this.isFollowersClicked,
      isScrolled: isScrolled ?? this.isScrolled,
    );
  }

  @override
  List<Object?> get props => [
        _profileModel,
        isPostsClicked,
        isFollowingClicked,
        isFollowersClicked,
        isScrolled
      ];
}
