import 'package:flutter/material.dart';
import 'package:velocore/scroll_keyboard_closer.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScrollKeyboardCloser(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ),
          ),
        ),
      );
    });
  }
}
