import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/article_bloc/article_bloc.dart';
import '../../../../bloc/article_bloc/article_event.dart';
import '../../../widgets/shimmer.dart';

class ArticleLoadingWidget extends StatelessWidget {
  const ArticleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: IconButton(
                  onPressed: () {
                    context
                        .read<ArticleBloc>()
                        .add(ArticleNavigateToBack(context: context));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_outlined),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(32),
            child: ShimmerWidget.rectangular(
              height: 40,
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ShimmerWidget.rectangular(
                  height: 56,
                  width: 56,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 200,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 80,
                    ),
                  ],
                )
              ],
            ),
          ),
          ShimmerWidget.rectangular(
            height: size.height * 0.3,
            width: double.maxFinite,
            shapeBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
            child: ShimmerWidget.rectangular(
              height: 40,
              width: double.maxFinite,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: ShimmerWidget.rectangular(
              height: 20,
              width: double.maxFinite,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: ShimmerWidget.rectangular(
              height: 20,
              width: double.maxFinite,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: ShimmerWidget.rectangular(
              height: 20,
              width: double.maxFinite,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: ShimmerWidget.rectangular(
              height: 20,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
