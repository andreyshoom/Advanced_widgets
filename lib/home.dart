import 'package:flutter_inheritedwidget/shadow.dart';
import 'package:flutter_inheritedwidget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double _currentSliderValue = 0;
  Animation? _animataion;
  AnimationController? _animationController;
  bool zoomInOut = true;
  bool isCompleted = false;
  String weatherCalled = 'Sunny';

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animataion = Tween(begin: 80.0, end: 400.0).animate(_animationController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isCompleted = true;
        } else {
          isCompleted = false;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _zoom() {
    setState(() {
      if (zoomInOut) {
        zoomInOut = false;
        _animationController?.forward();
      } else {
        zoomInOut = true;
        _animationController?.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change color',
      theme: CustomTheme.of(context).theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Change Colors'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _zoom();
                },
                child: AnimatedBuilder(
                  animation: _animataion!,
                  builder: (context, child) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: _animataion?.value,
                          height:
                              _animataion?.value + _animataion?.value * 0.25,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: CustomPaint(
                              painter:
                                  Weather(weatherOpacity: _currentSliderValue),
                              child: isCompleted
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InnerShadow(
                                          blur: 2,
                                          color: Colors.blue[900] as Color,
                                          offset: const Offset(1, 10),
                                          child: Text(
                                            '$weatherCalled,\n25 degrees',
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Slider(
                value: _currentSliderValue,
                max: 1,
                divisions: 10,
                label: _currentSliderValue.toString(),
                onChanged: (value) {
                  setState(() {
                    _currentSliderValue = value;
                    if (_currentSliderValue >= 0 && _currentSliderValue < 0.5) {
                      weatherCalled = 'Sunny';
                    } else if (_currentSliderValue >= 0.5 &&
                        _currentSliderValue < 0.8) {
                      weatherCalled = 'Cloudy';
                    } else {
                      weatherCalled = 'Rainy';
                    }
                  });
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.small(
              child: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
              onPressed: () {
                CustomTheme.updateTheme(
                  context,
                  CustomThemeData(theme: CustomThemeData.themeLight),
                );
              },
            ),
            FloatingActionButton.small(
              child: const Icon(
                Icons.circle,
                color: Colors.black,
              ),
              onPressed: () {
                CustomTheme.updateTheme(
                  context,
                  CustomThemeData(theme: CustomThemeData.themeDark),
                );
              },
            ),
            FloatingActionButton.small(
              child: const Icon(
                Icons.circle,
                color: Colors.purple,
              ),
              onPressed: () {
                CustomTheme.updateTheme(
                  context,
                  CustomThemeData(theme: CustomThemeData.themePurple),
                );
              },
            ),
            FloatingActionButton.small(
              child: const Icon(
                Icons.circle,
                color: Colors.red,
              ),
              onPressed: () {
                CustomTheme.updateTheme(
                  context,
                  CustomThemeData(theme: CustomThemeData.themeRed),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
