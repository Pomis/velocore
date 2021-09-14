import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Usage `SystemChrome.setSystemUIOverlayStyle(getSystemTheme(theme));`
SystemUiOverlayStyle getSystemTheme(ThemeData theme) {
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: theme.scaffoldBackgroundColor,
    systemNavigationBarDividerColor: theme.scaffoldBackgroundColor,
    statusBarBrightness: theme.brightness == Brightness.light ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    systemNavigationBarIconBrightness: theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
  );
}
