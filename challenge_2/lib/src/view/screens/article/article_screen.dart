import 'package:challenge_2/src/view/screens/article/widgets/article_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/article_bloc/article_bloc.dart';
import '../../../bloc/article_bloc/article_event.dart';
import '../../../bloc/article_bloc/article_state.dart';
import '../../../configs/app_theme.dart';
import 'widgets/article_success.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    super.key,
    this.callback,
  });
  final Future<bool> Function()? callback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RepositoryProvider.of<ArticleBloc>(context)..add(ArticleStarted()),
      child: Scaffold(
        backgroundColor: AppTheme.lightTheme.colorScheme.surface,
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoading) {
              return const ArticleLoadingWidget();
            }
            if (state is ArticleSuccess) {
              return ArticleSuccessWidget(
                callback: callback,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
