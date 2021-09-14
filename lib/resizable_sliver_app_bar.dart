import 'package:flutter/material.dart';

import 'measure_size.dart';

typedef SliverAppBarBuilder = Widget Function(double toolbarHeight, double expandedHeight);

/// Widget that could be used instead of SliverAppBar and has ability to change 
/// it's size according to content height
class ResizableSliverAppBar extends StatefulWidget {
  const ResizableSliverAppBar({
    Key? key,
    this.header,
    this.title,
    required this.builder,
  }) : super(key: key);

  final Widget? header;
  final Widget? title;
  final SliverAppBarBuilder builder;

  @override
  State<StatefulWidget> createState() => _ResizableSliverAppBarState();
}

class _ResizableSliverAppBarState extends State<ResizableSliverAppBar> {
  double _toolbarHeight = 0;
  double _headerHeight = 0;

  double expandedHeight() {
    return _toolbarHeight + _headerHeight;
  }

  @override
  Widget build(BuildContext context) {
    final height = (widget.header as SizedBox).height;
    if (widget.header is SizedBox && height != null) {
      _headerHeight = height;
    }

    return Stack(
      children: [
        _measuringContainer(),
        if (_toolbarHeight != 0 && (widget.header == null || _headerHeight != 0))
          widget.builder(_toolbarHeight, expandedHeight()),
      ],
    );
  }

  void _refreshHeight() {
    if (widget.header == null && _toolbarHeight != 0) {
      setState(() {});
    } else {
      if (_toolbarHeight != 0 && _headerHeight != 0) {
        setState(() {});
      }
    }
  }

  Widget _measuringContainer() {
    return Opacity(
      opacity: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null)
            MeasureSize(
              child: widget.title!,
              onChange: (size) {
                _toolbarHeight = size.height;
                _refreshHeight();
              },
            ),
          if (widget.header != null && widget.header is! SizedBox)
            MeasureSize(
              child: widget.header!,
              onChange: (size) {
                _headerHeight = size.height;
                _refreshHeight();
              },
            ),
        ],
      ),
    );
  }
}
