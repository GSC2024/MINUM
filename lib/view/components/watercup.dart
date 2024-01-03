import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

// class WaterCup extends CustomPainter {
//   final double fillPercent;

//   WaterCup({required this.fillPercent});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = AppColor.kTextColor
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     final path = Path()
//       ..moveTo(size.width * 0.2, size.height)
//       ..lineTo(size.width * 0.8, size.height)
//       ..lineTo(size.width, 0)
//       ..lineTo(0, 0)
//       ..close();

//     canvas.drawPath(path, paint);

//     final fillPaint = Paint()
//       ..color = AppColor.kButonColor
//       ..style = PaintingStyle.fill;

//     final fillPath = Path()
//       ..moveTo(size.width * 0.2, size.height)
//       ..lineTo(size.width * 0.8, size.height)
//       ..lineTo(size.width, size.height * fillPercent)
//       ..lineTo(0, size.height * fillPercent)
//       ..close();

//     canvas.drawPath(fillPath, fillPaint);
//   }

//   @override
//   bool shouldRepaint(WaterCup oldDelegate) => true;
// }
class GlassPainter extends CustomPainter {
  final double waterLevel;

  GlassPainter(this.waterLevel);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the glass
    Paint glassPaint = Paint()
      ..color = AppColor.kTextColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    double waterHeight = size.height * waterLevel;
    Paint waterPaint = Paint()
      ..color = AppColor.kButtonColor
      ..style = PaintingStyle.fill;

    Path waterPath = Path()
      ..moveTo(size.width * 0.2 * (1 - waterLevel), size.height - waterHeight)
      ..lineTo(
          size.width * 0.8 * (1 + waterLevel * 0.25), size.height - waterHeight)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..close();

    canvas.drawPath(waterPath, waterPaint);

    Path glassPath = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(glassPath, glassPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
