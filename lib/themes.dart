import 'package:flutter/material.dart';

enum ThemesEnum {
  light,
  dark,
  purple,
  red,
}

class CustomThemeData {
  ThemeData theme;
  CustomThemeData({
    required this.theme,
  });

  static final ThemeData themeLight = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
  );

  static final ThemeData themeDark = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[700],
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.grey[600],
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData themePurple = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.purple[300],
      ),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
      ));

  static final ThemeData themeRed = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red[400],
    ),
    colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: Colors.red,
        brightness: Brightness.light),
  );

  static ThemeData getTheme(ThemesEnum themesEnum) {
    switch (themesEnum) {
      case ThemesEnum.light:
        return themeLight;
      case ThemesEnum.dark:
        return themeDark;
      case ThemesEnum.purple:
        return themePurple;
      case ThemesEnum.red:
        return themeRed;
      default:
        return themeLight;
    }
  }
}

class CustomTheme extends InheritedWidget {
  const CustomTheme({
    Key? key,
    required this.theme,
    required this.onUpdate,
    required Widget child,
  }) : super(key: key, child: child);

  final CustomThemeData theme;
  final void Function(CustomThemeData) onUpdate;

  static CustomThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    assert(result != null, 'No Theme found in context');
    return result!.theme;
  }

  static void updateTheme(BuildContext context, CustomThemeData data) {
    final result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    assert(result != null, 'NO update found in context');
    return result!.onUpdate(data);
  }

  @override
  bool updateShouldNotify(covariant CustomTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
