import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/app_data_source.dart';
import '../../view/screens/article/article_screen.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late AppDataSource _appDataSource;

  ProfileBloc({
    required AppDataSource appDataSource,
  }) : super(ProfileLoading()) {
    _appDataSource = appDataSource;
    on<ProfileStarted>(_onStarted);
    on<ProfileScrolled>(_onScrolled);
    on<ProfilePostsButtonClicked>(_onPostsButtonClicked);
    on<ProfileFollowingButtonClicked>(_onFollowingButtonClicked);
    on<ProfileFollowersButtonClicked>(_onFollowersButtonClicked);
    on<ProfileNavigateTo>(_onNavigateTo);
  }

  _onStarted(ProfileStarted event, Emitter<ProfileState> emit) async {
    await Future.delayed(const Duration(seconds: 2));

    emit(ProfileSuccess(profileModel: _appDataSource.profile));
  }

  _onPostsButtonClicked(
      ProfilePostsButtonClicked event, Emitter<ProfileState> emit) {
    emit(
      _buttonsStateChanged(
        isPostsClicked: !(state as ProfileSuccess).isPostsClicked,
        isFollowingClicked: false,
        isFollowersClicked: false,
      ),
    );
  }

  _onFollowingButtonClicked(
      ProfileFollowingButtonClicked event, Emitter<ProfileState> emit) {
    emit(
      _buttonsStateChanged(
        isPostsClicked: false,
        isFollowingClicked: !(state as ProfileSuccess).isFollowingClicked,
        isFollowersClicked: false,
      ),
    );
  }

  _onFollowersButtonClicked(
      ProfileFollowersButtonClicked event, Emitter<ProfileState> emit) {
    emit(
      _buttonsStateChanged(
          isPostsClicked: false,
          isFollowingClicked: false,
          isFollowersClicked: !(state as ProfileSuccess).isFollowersClicked),
    );
  }

  ProfileState _buttonsStateChanged(
      {required bool isPostsClicked,
      required bool isFollowingClicked,
      required bool isFollowersClicked}) {
    return (state as ProfileSuccess).copyWith(
        isFollowingClicked: isFollowingClicked,
        isFollowersClicked: isFollowersClicked,
        isPostsClicked: isPostsClicked);
  }

  _onScrolled(ProfileScrolled event, Emitter<ProfileState> emit) {
    emit((state as ProfileSuccess).copyWith(isScrolled: event.isScrolled));
  }

  _onNavigateTo(ProfileNavigateTo event, Emitter<ProfileState> emit) {
    Navigator.of(event.context).push(
      MaterialPageRoute(
        builder: (settings) => const ArticleScreen(),
      ),
    );
  }
}
