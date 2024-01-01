import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class WaterCup extends CustomPainter {
  final double fillPercent;

  WaterCup({required this.fillPercent});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.kTextColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // final path = Path()
    //   ..moveTo(0, size.height)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width * 0.8, 0)
    //   ..lineTo(size.width * 0.2, 0)
    //   ..close();

    final path = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);

    final fillPaint = Paint()
      ..color = AppColor.kButonColor
      ..style = PaintingStyle.fill;

    // final fillPath = Path()
    //   ..moveTo(0, size.height)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width * 0.8, size.height * (1 - fillPercent))
    //   ..lineTo(size.width * 0.2, size.height * (1 - fillPercent))
    //   ..close();
    final fillPath = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, size.height * fillPercent)
      ..lineTo(0, size.height * fillPercent)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(WaterCup oldDelegate) => true;
}
