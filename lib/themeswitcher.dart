import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget/themes.dart';

class ThemeSwitcher extends StatefulWidget {
  final CustomThemeData initialTheme;
  final Widget child;

  const ThemeSwitcher({
    Key? key,
    required this.initialTheme,
    required this.child,
  }) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  CustomThemeData? _updatedTheme;

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      theme: _updatedTheme ?? widget.initialTheme,
      onUpdate: (newTheme) => setState(() {
        _updatedTheme = newTheme;
      }),
      child: widget.child,
    );
  }
}
