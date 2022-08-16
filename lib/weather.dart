import 'package:flutter/material.dart';

class Weather extends CustomPainter {
  final double weatherOpacity;

  Weather({required this.weatherOpacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..color = Colors.yellow[600]?.withOpacity(_getSunOpacity(weatherOpacity))
          as Color
      ..style = PaintingStyle.fill;

    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawCircle(center, size.height * 0.125, paintCircle);

    final paintCloud = Paint()
      ..color = (weatherOpacity >= 0.8
          ? Colors.grey[600]
          : Colors.grey[300]?.withOpacity(_getCloudOpacity(weatherOpacity))
              as Color)!
      ..style = PaintingStyle.fill;

    var pathCloud = Path()
      ..moveTo(
        size.width / 2 - size.width * 0.05,
        size.height / 2 + size.width * 0.05,
      )
      ..quadraticBezierTo(
        size.width / 2 + size.width * 0.05,
        size.height / 2 - size.width * 0.1,
        size.width / 2 + size.width * 0.2,
        size.height / 2 + size.width * 0.05,
      )
      ..quadraticBezierTo(
        size.width / 2 + size.width * 0.6,
        size.height / 2 + size.width * 0.175,
        size.width / 2 + size.width * 0.25,
        size.height / 2 + size.width * 0.25,
      )
      ..cubicTo(
        size.width / 2 + size.width * 0.15,
        size.height / 2 + size.width * 0.275,
        size.width / 2 - size.width * 0.5,
        size.height / 2 + size.width * 0.25,
        size.width / 2 - size.width * 0.325,
        size.height / 2 + size.width * 0.125,
      )
      ..cubicTo(
        size.width / 2 - size.width * 0.325,
        size.height / 2 + size.width * 0.1,
        size.width / 2 - size.width * 0.05,
        size.height / 2 - size.width * 0.05,
        size.width / 2 + size.width * 0.05,
        size.height / 2 + size.width * 0.05,
      )
      ..close();

    canvas.drawPath(pathCloud, paintCloud);

    final paintDrop1 = Paint()
      ..color = Colors.blue[300]?.withOpacity(_getDropsOpacity(weatherOpacity))
          as Color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final dropDx1 = Offset(
      size.width / 2,
      size.height / 2 + size.width * 0.3,
    );
    final dropDy1 = Offset(
      size.width / 2 - size.width * 0.05,
      size.height / 2 + size.width * 0.4,
    );

    canvas.drawLine(dropDx1, dropDy1, paintDrop1);

    final paintDrop2 = Paint()
      ..color = Colors.blue[300]?.withOpacity(_getDropsOpacity(weatherOpacity))
          as Color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final dropDx2 = Offset(
      size.width / 2 + size.width * 0.15,
      size.height / 2 + size.width * 0.3,
    );
    final dropDy2 = Offset(
      size.width / 2 + size.width * 0.1,
      size.height / 2 + size.width * 0.4,
    );

    canvas.drawLine(dropDx2, dropDy2, paintDrop2);

    final paintDrop3 = Paint()
      ..color = Colors.blue[300]?.withOpacity(_getDropsOpacity(weatherOpacity))
          as Color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final dropDx3 = Offset(
      size.width / 2 - size.width * 0.15,
      size.height / 2 + size.width * 0.3,
    );
    final dropDy3 = Offset(
      size.width / 2 - size.width * 0.2,
      size.height / 2 + size.width * 0.4,
    );

    canvas.drawLine(dropDx3, dropDy3, paintDrop3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }
    return 10 / 3 * value - 7 / 3;
  }

  double _getCloudOpacity(double value) {
    if (value <= 0.1) {
      return 0;
    }
    if (value > 0.7) {
      return 1;
    }
    return 1 / 0.6 * value - 0.1 / 0.6;
  }

  double _getSunOpacity(double value) {
    if (value >= 0 && value <= 0.7) {
      return 1;
    } else {
      return 0;
    }
  }
}
