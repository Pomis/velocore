import 'package:flutter/material.dart';

/// Usage:
/// ```
/// GradientText(
///   'Sample text',
///   style: TextStyle(
///     fontWeight: FontWeight.w500,
///     fontSize: 16,
///   ),
///   gradient: LinearGradient(
///     begin: Alignment.bottomLeft,
///     end: Alignment.topRight,
///     colors: [
///       Color(0xffff0000),
///       Color(0xff00ff00),
///     ],
///   ),
/// );
/// ```
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    this.gradient,
    this.textAlign,
    this.style,
    Key? key,
  }) : super(key: key);

  final String text;
  final Gradient? gradient;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return gradient != null
        ? ShaderMask(
            shaderCallback: (bounds) => gradient!.createShader(Offset.zero & bounds.size),
            child: Text(
              text,
              textAlign: textAlign,
              style: style?.copyWith(color: Colors.white),
            ),
          )
        : Text(text, textAlign: textAlign, style: style);
  }
}
