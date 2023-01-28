import 'package:challenge_2/src/view/widgets/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

class PostListLoadingState extends StatelessWidget {
  const PostListLoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: ColorName.postItemBoxShadowColor,
          ),
        ],
      ),
      child: Row(
        children: [
          ShimmerWidget.rectangular(
            width: 150,
            height: 150,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ShimmerWidget.rectangular(
                    width: 60,
                    height: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget.rectangular(
                    width: 200,
                    height: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget.rectangular(
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
