import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final OutlinedBorder? shape;
  final Color? shadowColor;
  final double? elevation;
  final Widget child;
  final VoidCallback voidCallback;

  const ButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.voidCallback,
    this.shape,
    this.shadowColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: shadowColor != null
            ? MaterialStateProperty.all(shadowColor)
            : MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: elevation != null
            ? MaterialStateProperty.all<double>(elevation!)
            : MaterialStateProperty.all<double>(4),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: shape != null
            ? MaterialStateProperty.all<OutlinedBorder?>(shape)
            : MaterialStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
      ),
      onPressed: voidCallback,
      child: child,
    );
  }
}
