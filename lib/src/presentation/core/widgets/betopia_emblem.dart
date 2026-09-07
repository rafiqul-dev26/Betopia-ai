import 'package:flutter/material.dart';

/// Large stylized Betopia AI emblem matching the home screen reference design.
/// Features the bold white 'b' circular ring and fiery orange center caret.
class BetopiaEmblem extends StatelessWidget {
  const BetopiaEmblem({super.key, this.size = 110});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BetopiaEmblemPainter(),
      ),
    );
  }
}

class _BetopiaEmblemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Outer white 'b' stroke ring
    final strokePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.095
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    // Vertical stem of the 'b' on left
    path.moveTo(w * 0.45, h * 0.10);
    path.lineTo(w * 0.45, h * 0.90);

    // Large outer circular loop of the 'b'
    final loopRect = Rect.fromCircle(
      center: Offset(w * 0.54, h * 0.58),
      radius: w * 0.32,
    );
    path.arcTo(loopRect, 3.14159 * 0.85, 3.14159 * 1.82, false);

    canvas.drawPath(path, strokePaint);

    // Fiery orange play/caret triangle in center
    final trianglePaint = Paint()
      ..color = const Color(0xFFFF640A)
      ..style = PaintingStyle.fill;

    final trianglePath = Path();
    final cx = w * 0.53;
    final cy = h * 0.58;
    final s = w * 0.16;

    // Right-pointing triangle
    trianglePath.moveTo(cx - s * 0.45, cy - s * 0.70);
    trianglePath.lineTo(cx + s * 0.70, cy);
    trianglePath.lineTo(cx - s * 0.45, cy + s * 0.70);
    trianglePath.close();

    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
