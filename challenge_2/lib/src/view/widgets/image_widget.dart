import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String _assetName;
  final BorderRadius _borderRadius;
  final double? width;
  final double? height;

  const ImageWidget({
    Key? key,
    required String assetName,
    BorderRadius? borderRadius,
    this.width,
    this.height,
  })  : _assetName = assetName,
        _borderRadius = borderRadius ?? BorderRadius.zero,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Image.asset(
        _assetName,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
