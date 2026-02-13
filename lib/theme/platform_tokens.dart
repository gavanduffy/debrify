import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformThemeTokens {
  final ColorScheme colorScheme;
  final double cardRadius;
  final double controlRadius;
  final double cardElevation;
  final bool centerAppBarTitle;
  final bool useDenseDesktopControls;
  final String? fontFamily;

  const PlatformThemeTokens({
    required this.colorScheme,
    required this.cardRadius,
    required this.controlRadius,
    required this.cardElevation,
    required this.centerAppBarTitle,
    required this.useDenseDesktopControls,
    this.fontFamily,
  });

  factory PlatformThemeTokens.current() {
    final isApple = !kIsWeb && (Platform.isIOS || Platform.isMacOS);
    final isWindows = !kIsWeb && Platform.isWindows;
    final scheme = ColorScheme.fromSeed(
      seedColor: isApple
          ? CupertinoColors.systemBlue.color
          : isWindows
              ? const Color(0xFF0067C0)
              : const Color(0xFF4F46E5),
      brightness: Brightness.light,
    );

    return PlatformThemeTokens(
      colorScheme: scheme,
      cardRadius: isApple ? 14 : (isWindows ? 8 : 10),
      controlRadius: isApple ? 12 : (isWindows ? 8 : 10),
      cardElevation: isApple ? 0 : 1,
      centerAppBarTitle: isApple,
      useDenseDesktopControls: isWindows,
      fontFamily: isWindows ? 'Segoe UI' : null,
    );
  }
}
