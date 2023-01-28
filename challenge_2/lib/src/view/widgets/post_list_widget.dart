import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../configs/app_theme.dart';
import '../../data/models/post_model.dart';
import 'image_widget.dart';

class PostListWidget extends StatelessWidget {
  late final List<PostModel> _posts;
  late final double _itemExtent;
  late final ScrollPhysics? _physics;
  late final VoidCallback _voidCallback;

  PostListWidget({
    Key? key,
    required double itemExtent,
    required List<PostModel> posts,
    required VoidCallback voidCallback,
    ScrollPhysics? physics,
  }) : super(key: key) {
    _itemExtent = itemExtent;
    _physics = physics;
    _voidCallback = voidCallback;
    _posts = posts;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: _itemExtent * _posts.length + 16,
      child: ListView.builder(
        itemCount: _posts.length,
        itemExtent: _itemExtent,
        physics: _physics ?? const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var post = _posts[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: ColorName.postItemBoxShadowColor,
                  ),
                ]),
            child: InkWell(
              onTap: _voidCallback,
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  ImageWidget(
                    assetName: post.imageFileName,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            post.caption,
                            style: AppTheme.lightTheme.textTheme.bodySmall!
                                .apply(color: ColorName.primaryColor),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            post.title,
                            style: AppTheme.lightTheme.textTheme.titleSmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    CupertinoIcons.hand_thumbsup,
                                    size: 20,
                                    color: AppTheme
                                        .lightTheme.textTheme.bodyMedium!.color,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.likes,
                                    style: AppTheme
                                        .lightTheme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    CupertinoIcons.clock,
                                    size: 20,
                                    color: AppTheme
                                        .lightTheme.textTheme.bodyMedium!.color,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.time,
                                    style: AppTheme
                                        .lightTheme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    post.isBookmarked
                                        ? CupertinoIcons.bookmark_fill
                                        : CupertinoIcons.bookmark,
                                    size: 16,
                                    color: AppTheme
                                        .lightTheme.textTheme.bodyMedium!.color,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
