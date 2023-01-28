import 'package:challenge_2/src/view/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

class UserAvatar extends StatelessWidget {
  final String _assetName;
  final double _outerBoxSize;
  final double _innerBoxSize;

  const UserAvatar({
    Key? key,
    required String assetName,
    required double outerBoxSize,
    required double innerBoxSize,
  })  : _assetName = assetName,
        _outerBoxSize = outerBoxSize,
        _innerBoxSize = innerBoxSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _outerBoxSize,
      height: _outerBoxSize,
      child: Container(
        width: _innerBoxSize,
        height: _innerBoxSize,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              ColorName.gradiantStartColor,
              ColorName.gradiantMiddleColor,
              ColorName.gradiantEndColor
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
          ),
          child: ImageWidget(
            assetName: _assetName,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
