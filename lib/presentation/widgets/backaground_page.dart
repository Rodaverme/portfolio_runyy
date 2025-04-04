import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Dibuja círculos en diferentes posiciones
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3),
      size.width * 0.15,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.7),
      size.width * 0.1,
      paint,
    );

    // Dibuja un rectángulo rotado
    final rect = Rect.fromCenter(
      center: Offset(size.width * 0.7, size.height * 0.2),
      width: size.width * 0.2,
      height: size.width * 0.2,
    );
    canvas.save();
    canvas.rotate(0.5);
    canvas.drawRect(rect, paint);
    canvas.restore();

    // Dibuja un triángulo
    final path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.8)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}