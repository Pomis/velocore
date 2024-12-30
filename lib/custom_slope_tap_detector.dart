import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomSlopeTapDetector extends StatefulWidget {
  final double factor;
  final GestureTapCallback onTap;
  final Widget child;

  const CustomSlopeTapDetector({
    super.key,
    required this.factor,
    required this.onTap,
    required this.child,
  });

  @override
  State<CustomSlopeTapDetector> createState() => _CustomSlopeTapDetectorState();
}

class _CustomSlopeTapDetectorState extends State<CustomSlopeTapDetector> {
  Offset? _tapDownPosition;

  @override
  Widget build(BuildContext context) {
    final touchSlope = widget.factor *
        (MediaQuery.gestureSettingsOf(context).touchSlop ?? kTouchSlop);

    return GestureDetector(
      onTapDown: (details) {
        _tapDownPosition = details.globalPosition;
      },
      onTapUp: (details) {
        if (_tapDownPosition != null &&
            (details.globalPosition - _tapDownPosition!).distance <
                touchSlope) {
          widget.onTap();
        }
      },
      onTapCancel: () => _tapDownPosition = null,
      child: widget.child,
    );
  }
}
