import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget/home.dart';
import 'package:flutter_inheritedwidget/themes.dart';
import 'package:flutter_inheritedwidget/themeswitcher.dart';

void main() {
  runApp(
    ThemeSwitcher(
      initialTheme: CustomThemeData(
        theme: CustomThemeData.getTheme(
          ThemesEnum.light,
        ),
      ),
      child: const HomePage(),
    ),
  );
}
