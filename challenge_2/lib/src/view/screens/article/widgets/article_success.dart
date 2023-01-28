import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../bloc/article_bloc/article_bloc.dart';
import '../../../../bloc/article_bloc/article_event.dart';
import '../../../../bloc/article_bloc/article_state.dart';
import '../../../../configs/app_theme.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/image_widget.dart';

class ArticleSuccessWidget extends StatelessWidget {
  final Future<bool> Function()? callback;
  final ScrollController _scrollController = ScrollController();

  ArticleSuccessWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Builder(
      builder: (context) {
        ArticleSuccess state = context.select(
          (ArticleBloc bloc) {
            late ArticleSuccess state;
            if (bloc.state is ArticleSuccess) {
              state = (bloc.state) as ArticleSuccess;
            }
            return state;
          },
        );

        _scrollController.addListener(
          () {
            bool isScrolled = _scrollController.hasClients &&
                _scrollController.offset > kToolbarHeight;
            context.read<ArticleBloc>().add(
                  ArticleScrolled(isScrolled: isScrolled),
                );
          },
        );
        return Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    toolbarHeight: kToolbarHeight,
                    elevation: state.isScrolled ? 4 : 0,
                    leading: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16),
                      child: IconButton(
                        onPressed: callback,
                        icon: const Icon(Icons.arrow_back_ios_outlined),
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
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text(
                            state.article.title,
                            style: AppTheme.lightTheme.textTheme.headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                          child: Row(
                            children: [
                              ImageWidget(
                                width: 56,
                                height: 56,
                                assetName: state.article.authorImageFileName,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.article.author,
                                      style: AppTheme
                                          .lightTheme.textTheme.bodyLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(state.article.time),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.share,
                                    color:
                                        AppTheme.lightTheme.colorScheme.primary,
                                  )),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  state.article.isBookmarked
                                      ? CupertinoIcons.bookmark_fill
                                      : CupertinoIcons.bookmark,
                                  color:
                                      AppTheme.lightTheme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ImageWidget(
                          assetName: state.article.postImageFileName,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                          child: Text(
                            state.article.caption,
                            style: AppTheme.lightTheme.textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                          child: Text(
                            state.article.description,
                            style: AppTheme.lightTheme.textTheme.bodyMedium!
                                .copyWith(wordSpacing: 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      AppTheme.lightTheme.colorScheme.surface,
                      AppTheme.lightTheme.colorScheme.surface.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.directional(
              bottom: 16,
              end: 16,
              textDirection: TextDirection.ltr,
              child: ButtonWidget(
                width: 120,
                height: 60,
                elevation: 10,
                shadowColor: AppTheme.lightTheme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                voidCallback: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icons.thumbs.svg(
                        width: 24,
                        height: 24,
                        color: AppTheme.lightTheme.colorScheme.onPrimary),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      state.article.likes,
                      style: AppTheme.lightTheme.textTheme.bodyLarge!.apply(
                        color: AppTheme.lightTheme.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
