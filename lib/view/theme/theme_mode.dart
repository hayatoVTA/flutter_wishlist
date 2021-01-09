import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'theme_data.dart';

enum ExThemeMode {
  system,
  dark,
  skyBlue,
  emeraldGreen,
}

extension Extention on ExThemeMode {
  int get id {
    switch (this) {
      case ExThemeMode.system:
        return 1000;
      case ExThemeMode.dark:
        return 1002;
      case ExThemeMode.emeraldGreen:
        return 1003;
      case ExThemeMode.skyBlue:
        return 1004;
    }
    return 0;
  }

  /// Display names
  String get name {
    switch (this) {
      case ExThemeMode.system:
        return 'Default';
      case ExThemeMode.dark:
        return 'Dark';
      case ExThemeMode.emeraldGreen:
        return 'Emerald Green';
      case ExThemeMode.skyBlue:
        return 'Sky Blue';
    }
    return null;
  }

  /// Display descriptions
  String get description {
    switch (this) {
      case ExThemeMode.system:
        return 'デフォルトカラー';
      case ExThemeMode.dark:
        return 'ダークモード';
      case ExThemeMode.emeraldGreen:
        return 'エメラルドグリーン';
      case ExThemeMode.skyBlue:
        return 'スカイブルー';
    }
    return null;
  }

  /// Themes icon
  IconData get icon {
    switch (this) {
      case ExThemeMode.system:
        return Icons.settings;
      case ExThemeMode.dark:
        return MdiIcons.weatherNight;
      case ExThemeMode.emeraldGreen:
        return MdiIcons.tree;
      case ExThemeMode.skyBlue:
        return MdiIcons.sword;
    }
    return null;
  }

  /// Theme by ExThemeMode
  ThemeData get themeData {
    switch (this) {
      case ExThemeMode.system:
        return greyTheme;

      case ExThemeMode.dark:
        return simpleDarkTheme;

      case ExThemeMode.emeraldGreen:
        return emeraldGreenTheme;

      case ExThemeMode.skyBlue:
        return skyBlueTheme;
    }
    return null;
  }

  /// Theme by ExThemeMode for Dark mode
  ThemeData get darkThemeData {
    switch (this) {
      case ExThemeMode.system:
        return simpleDarkTheme;

      default:
        return null;
    }
  }
}
