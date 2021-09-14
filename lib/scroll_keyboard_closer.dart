import 'package:flutter/widgets.dart';

class ScrollKeyboardCloser extends StatelessWidget {
  const ScrollKeyboardCloser({required this.child});

  final Widget child;

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
