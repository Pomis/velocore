import 'dart:io';

import 'package:flutter/material.dart';

class TapArea extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongTap;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final bool useInkResponse;
  final bool isRippleEffectOnAndroidDisabled;

  const TapArea({
    required this.child,
    required this.onTap,
    this.onLongTap,
    this.padding,
    this.borderRadius ,
    this.useInkResponse = false,
    this.isRippleEffectOnAndroidDisabled = false,
  });

  @override
  State<TapArea> createState() => Platform.isAndroid ? _TapAreaAndroidState() : _TapAreaIosState();
}

class _TapAreaAndroidState extends State<TapArea> {
  @override
  Widget build(BuildContext context) {
    if (widget.isRippleEffectOnAndroidDisabled) {
      return GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongTap,
        child: _content(),
      );
    }
    if (widget.onTap == null) return _content();

    return widget.useInkResponse
        ? InkResponse(
            onTap: widget.onTap,
            onLongPress: widget.onLongTap,
            child: _content(),
          )
        : Material(
            color: Colors.transparent,
            clipBehavior: Clip.none,
            borderRadius: widget.borderRadius,
            child: InkWell(
              borderRadius: widget.borderRadius,
              onTap: widget.onTap,
              onLongPress: widget.onLongTap,
              child: _content(),
            ),
          );
  }

  Widget _content() {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: widget.child,
    );
  }
}

class _TapAreaIosState extends State<TapArea> {
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null && widget.onLongTap == null) return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: widget.child,
    );

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isDown = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isDown = false;
        });
      },
      onTap: () {
        setState(() {
          _isDown = false;
        });
        widget.onTap!();
      },
      onLongPress: widget.onLongTap,
      child: Focus(
        child: MouseRegion(
          child: Opacity(
            opacity: _isDown ? 0.7 : 1.0,
            child: Padding(padding: widget.padding ?? EdgeInsets.zero, child: widget.child),
          ),
        ),
      ),
    );
  }
}
