import 'package:challenge_2/src/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/colors.gen.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/home_bloc/home_event.dart';
import '../../../configs/app_theme.dart';
import 'widgets/category_list.dart';
import 'widgets/post_list.dart';
import 'widgets/story_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RepositoryProvider.of<HomeBloc>(context)..add(HomeStarted()),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _appBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Explore today\'s',
                        style: AppTheme.lightTheme.textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const StoryList(),
                    const CategoryList(),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest News',
                            style: AppTheme.lightTheme.textTheme.headlineSmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'More',
                              style: TextStyle(color: ColorName.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const PostList(),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi, Hany!',
            style: AppTheme.lightTheme.textTheme.titleMedium,
          ),
          Image.asset(
            AssetsConstants.kHomeAppBarIconAsset,
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
