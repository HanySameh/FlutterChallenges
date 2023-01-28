import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../bloc/profile_bloc/profile_bloc.dart';
import '../../../../bloc/profile_bloc/profile_event.dart';
import '../../../../bloc/profile_bloc/profile_state.dart';
import '../../../../configs/app_theme.dart';
import '../../../widgets/post_list_widget.dart';
import '../../../widgets/user_avatar.dart';

class ProfileSuccessWidget extends StatelessWidget {
  const ProfileSuccessWidget({
    super.key,
    required this.innerFrameHeight,
    required this.outerFrameHeight,
    required this.state,
    required this.scrollController,
  });
  final double innerFrameHeight;
  final double outerFrameHeight;
  final ProfileSuccess state;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          toolbarHeight: kToolbarHeight,
          elevation: state.isScrolled ? 4 : 0,
          backgroundColor: state.isScrolled
              ? AppTheme.lightTheme.colorScheme.background
              : AppTheme.lightTheme.colorScheme.background.withOpacity(0.2),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Text(
              'Profile',
              style: AppTheme.lightTheme.textTheme.headlineMedium,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_outlined),
              ),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: outerFrameHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: 18,
                      top: 32,
                      left: 96,
                      right: 96,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: AppTheme
                                  .lightTheme.colorScheme.onBackground
                                  .withOpacity(0.3),
                            )
                          ],
                        ),
                      ),
                    ),
                    _profileDetail(innerFrameHeight, state),
                    _profileInfoActions(
                        outerFrameHeight, innerFrameHeight, state, context)
                  ],
                ),
              ),
              _postListHeader(state, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _profileDetail(double innerFrameHeight, ProfileSuccess state) {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
        height: innerFrameHeight,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color:
                  AppTheme.lightTheme.colorScheme.onBackground.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                UserAvatar(
                  assetName: state.profileModel.profileImageFileName,
                  outerBoxSize: 84,
                  innerBoxSize: 82,
                ),
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.profileModel.id,
                        style: AppTheme.lightTheme.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.profileModel.fullName,
                        style:
                            AppTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.profileModel.field,
                        style: AppTheme.lightTheme.textTheme.bodyLarge!.apply(
                          color: AppTheme.lightTheme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'About me',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              state.profileModel.aboutMe,
              style: AppTheme.lightTheme.textTheme.bodyLarge,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfoActions(double outerFrameHeight, double innerFrameHeight,
      ProfileSuccess state, BuildContext context) {
    return Positioned(
      bottom: (outerFrameHeight - innerFrameHeight) / 2,
      right: 48,
      left: 48,
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _profileInfoActionItem(
              title: 'Posts',
              count: state.profileModel.posts.length.toString(),
              isClicked: state.isPostsClicked,
              onTap: () =>
                  context.read<ProfileBloc>().add(ProfilePostsButtonClicked()),
            ),
            _profileInfoActionItem(
              title: 'Following',
              count: state.profileModel.following,
              isClicked: state.isFollowingClicked,
              onTap: () => context
                  .read<ProfileBloc>()
                  .add(ProfileFollowingButtonClicked()),
            ),
            _profileInfoActionItem(
              title: 'Followers',
              count: state.profileModel.followers,
              isClicked: state.isFollowersClicked,
              onTap: () => context
                  .read<ProfileBloc>()
                  .add(ProfileFollowersButtonClicked()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postListHeader(ProfileSuccess state, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color:
                AppTheme.lightTheme.colorScheme.onBackground.withOpacity(0.01),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Posts',
                  style: AppTheme.lightTheme.textTheme.titleLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Assets.img.icons.grid.svg(
                        color: AppTheme.lightTheme.colorScheme.onBackground
                            .withOpacity(0.4),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Assets.img.icons.table.svg(
                        color: AppTheme.lightTheme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PostListWidget(
            posts: state.profileModel.posts,
            itemExtent: 150,
            physics: const NeverScrollableScrollPhysics(),
            voidCallback: () => context.read<ProfileBloc>().add(
                  ProfileNavigateTo(context: context),
                ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _profileInfoActionItem({
    required String title,
    required String count,
    required bool isClicked,
    required VoidCallback onTap,
  }) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: isClicked
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorName.darkPrimaryColor,
                )
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count,
                style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.lightTheme.colorScheme.onPrimary,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: AppTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w200,
                  color: AppTheme.lightTheme.colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
