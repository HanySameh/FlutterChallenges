import 'package:flutter/material.dart';

import '../../../../configs/app_theme.dart';
import '../../../widgets/post_list_loading.dart';
import '../../../widgets/shimmer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({
    super.key,
    required this.innerFrameHeight,
  });
  final double innerFrameHeight;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          toolbarHeight: kToolbarHeight,
          elevation: 0,
          backgroundColor: AppTheme.lightTheme.colorScheme.background,
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
              padding: const EdgeInsetsDirectional.only(end: 16),
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
              Container(
                padding: const EdgeInsets.all(32),
                margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                height: innerFrameHeight,
                decoration: BoxDecoration(
                  color: AppTheme.lightTheme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: AppTheme.lightTheme.colorScheme.onBackground
                          .withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ShimmerWidget.rectangular(
                          height: 84,
                          width: 84,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerWidget.rectangular(
                              height: 15,
                              width: 100,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ShimmerWidget.rectangular(
                              height: 15,
                              width: 100,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ShimmerWidget.rectangular(
                              height: 15,
                              width: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const ShimmerWidget.rectangular(
                      height: 15,
                      width: 400,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ShimmerWidget.rectangular(
                      height: 15,
                      width: 100,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightTheme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: AppTheme.lightTheme.colorScheme.onBackground
                          .withOpacity(0.01),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 64,
                      ),
                      PostListLoadingState(),
                      SizedBox(
                        height: 16,
                      ),
                      PostListLoadingState(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
