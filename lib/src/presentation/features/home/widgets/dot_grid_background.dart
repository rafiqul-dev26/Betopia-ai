import 'package:flutter/material.dart';

/// Ambient dark backdrop with a subtle dot grid matrix pattern.
class DotGridBackground extends StatelessWidget {
  const DotGridBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Solid deep graphite background
        Positioned.fill(
          child: Container(
            color: const Color(0xFF0C0D11),
          ),
        ),
        // Ambient soft circular glow in center
        Positioned.fill(
          child: CustomPaint(
            painter: _AmbientGlowPainter(),
          ),
        ),
        // Dot grid matrix
        Positioned.fill(
          child: CustomPaint(
            painter: _DotGridPainter(),
          ),
        ),
        // Child content
        Positioned.fill(child: child),
      ],
    );
  }
}

class _AmbientGlowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.38);
    final radius = size.width * 0.65;

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF262A38).withValues(alpha: 0.35),
          const Color(0xFF14161F).withValues(alpha: 0.15),
          Colors.transparent,
        ],
        stops: const [0.0, 0.55, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF262936).withValues(alpha: 0.45)
      ..style = PaintingStyle.fill;

    const spacing = 32.0;
    const dotRadius = 0.85;

    for (double x = spacing * 0.5; x < size.width; x += spacing) {
      for (double y = spacing * 0.5; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
