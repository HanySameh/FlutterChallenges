import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../bloc/home_bloc/home_event.dart';
import '../../../../bloc/home_bloc/home_state.dart';
import '../../../../data/models/story_model.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/shimmer.dart';
import '../../../widgets/user_avatar.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        late Widget result;
        if (state.status == HomeStatus.loading) {
          result = _storyListLoadingStateView();
        }
        if (state.status == HomeStatus.success) {
          result = _storyListSuccessStateView(state);
        }
        return result;
      },
    );
  }

  Widget _storyListLoadingStateView() {
    return SizedBox(
      width: double.maxFinite,
      height: 100,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: const ShimmerWidget.rectangular(
                    width: 68,
                    height: 68,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const ShimmerWidget.rectangular(
                  width: 40,
                  height: 10,
                )
              ],
            );
          }),
    );
  }

  Widget _storyListSuccessStateView(HomeState state) {
    return SizedBox(
      width: double.maxFinite,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        itemCount: state.stories.length,
        itemBuilder: (context, index) {
          var story = state.stories[index];

          return _storyItem(story);
        },
      ),
    );
  }

  Widget _storyItem(StoryModel story) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 8, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _seenStoryView(story) : _storyView(story),
              _storyBadge(story)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _storyBadge(StoryModel story) {
    return Positioned(
      bottom: -2,
      right: -2,
      child: Image.asset(
        story.iconFileName,
        width: 24,
        height: 24,
      ),
    );
  }

  Widget _storyView(StoryModel story) {
    return UserAvatar(
      assetName: story.imageFileName,
      outerBoxSize: 70,
      innerBoxSize: 68,
    );
  }

  Widget _seenStoryView(StoryModel story) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Container(
        width: 68,
        height: 68,
        padding: const EdgeInsets.all(1),
        child: DottedBorder(
          strokeWidth: 2,
          color: ColorName.dotColor,
          borderType: BorderType.RRect,
          radius: const Radius.circular(24),
          dashPattern: const [10, 3],
          padding: const EdgeInsets.all(7),
          child: ImageWidget(
            assetName: story.imageFileName,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
