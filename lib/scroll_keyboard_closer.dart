import 'package:flutter/widgets.dart';

class ScrollKeyboardCloser extends StatelessWidget {
  final Widget child;

  const ScrollKeyboardCloser({required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is UserScrollNotification) {
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: child,
    );
  }
}