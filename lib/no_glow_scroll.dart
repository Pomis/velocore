import 'package:flutter/widgets.dart';

/// Use to remove Android Glow effect for scrolling
/// Usage
/// ```
/// MaterialApp(
///   ...
///   builder: (context, child) {
///     return ScrollConfiguration(
///       behavior: NoGlowBehavior(),
///       child: child ?? const SizedBox.shrink(),
///     );
///   },
///   onGenerateRoute: (settings) {
///     ...
///   },
/// );
/// ```
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
