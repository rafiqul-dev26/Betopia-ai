import 'package:flutter/material.dart';

/// Renders the multi-color Google 'G' icon for social login.
class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key, this.size = 18});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GoogleIconPainter(),
      ),
    );
  }
}

class _GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final bluePaint = Paint()..color = const Color(0xFF4285F4);
    final redPaint = Paint()..color = const Color(0xFFEA4335);
    final yellowPaint = Paint()..color = const Color(0xFFFBBC05);
    final greenPaint = Paint()..color = const Color(0xFF34A853);

    // Blue horizontal bar
    final blueBar = Path()
      ..moveTo(w * 0.5, h * 0.40)
      ..lineTo(w * 0.95, h * 0.40)
      ..lineTo(w * 0.95, h * 0.60)
      ..lineTo(w * 0.5, h * 0.60)
      ..close();
    canvas.drawPath(blueBar, bluePaint);

    final rect = Rect.fromLTWH(0, 0, w, h);

    // Red top arc
    final redPath = Path()
      ..arcTo(rect, -0.75, 1.5, false)
      ..lineTo(w * 0.5, h * 0.5)
      ..close();
    canvas.drawPath(redPath, redPaint);

    // Yellow left arc
    final yellowPath = Path()
      ..arcTo(rect, 0.75, 1.5, false)
      ..lineTo(w * 0.5, h * 0.5)
      ..close();
    canvas.drawPath(yellowPath, yellowPaint);

    // Green bottom arc
    final greenPath = Path()
      ..arcTo(rect, 2.25, 1.5, false)
      ..lineTo(w * 0.5, h * 0.5)
      ..close();
    canvas.drawPath(greenPath, greenPaint);

    // Blue right arc
    final bluePath = Path()
      ..arcTo(rect, 3.75, 1.0, false)
      ..lineTo(w * 0.5, h * 0.5)
      ..close();
    canvas.drawPath(bluePath, bluePaint);

    // Inner cutout to make it a 'G'
    final innerPaint = Paint()..color = const Color(0xFF16181F);
    final innerRect = Rect.fromCircle(
      center: Offset(w * 0.5, h * 0.5),
      radius: w * 0.28,
    );
    canvas.drawOval(innerRect, innerPaint);

    // Re-draw the right horizontal bar of 'G'
    final barPaint = Paint()..color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTRB(w * 0.5, h * 0.40, w * 0.94, h * 0.60),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
