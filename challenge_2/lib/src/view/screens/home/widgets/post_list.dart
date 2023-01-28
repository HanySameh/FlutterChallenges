import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/home_bloc/home_bloc.dart';
import '../../../../bloc/home_bloc/home_event.dart';
import '../../../../bloc/home_bloc/home_state.dart';
import '../../../widgets/post_list_loading.dart';
import '../../../widgets/post_list_widget.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      late Widget result;
      if (state.status == HomeStatus.loading) {
        result = const PostListLoadingState();
      }
      if (state.status == HomeStatus.success) {
        result = PostListWidget(
          posts: state.posts,
          itemExtent: 150,
          voidCallback: () => context.read<HomeBloc>().add(
                HomeNavigateTo(context: context),
              ),
        );
      }
      return result;
    });
  }
}
