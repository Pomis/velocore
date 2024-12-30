import 'package:flutter/material.dart';

/// Use instead of SafeArea
class ColoredSafeArea extends StatelessWidget {
  const ColoredSafeArea({
    required this.child,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    this.color,
    Key? key,
  }) : super(key: key);

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
  final Widget child;

  // Color for unsafe area (around Scaffold)
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
        child: child,
      ),
    );
  }
}
