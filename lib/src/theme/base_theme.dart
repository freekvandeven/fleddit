import 'package:fleddit/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData getBaseTheme({
  required ColorScheme colorScheme,
}) =>
    ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: false,
    );
