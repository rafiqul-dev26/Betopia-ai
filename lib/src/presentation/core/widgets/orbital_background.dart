import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Renders the elegant orbital curves and glowing background art from the
/// design.
class OrbitalBackground extends StatelessWidget {
  const OrbitalBackground({
    super.key,
    required this.child,
    this.showOrbits = true,
  });

  final Widget child;
  final bool showOrbits;

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
        // Orbital arcs painter
        if (showOrbits)
          Positioned.fill(
            child: CustomPaint(
              painter: _OrbitalArcsPainter(),
            ),
          ),
        // Foreground content
        Positioned.fill(child: child),
      ],
    );
  }
}

class _OrbitalArcsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Origin near bottom-right
    final origin = Offset(w * 0.85, h * 0.95);

    final arcConfigs = [
      (
        radius: w * 0.55,
        opacity: 0.18,
        color: const Color(0xFFC084FC),
        width: 1.2,
      ),
      (
        radius: w * 0.80,
        opacity: 0.14,
        color: const Color(0xFFE2A850),
        width: 1.0,
      ),
      (
        radius: w * 1.10,
        opacity: 0.22,
        color: const Color(0xFFFF7A1A),
        width: 1.4,
      ),
      (
        radius: w * 1.40,
        opacity: 0.12,
        color: const Color(0xFFA855F7),
        width: 1.0,
      ),
      (
        radius: w * 1.70,
        opacity: 0.10,
        color: const Color(0xFFD97706),
        width: 0.8,
      ),
    ];

    for (final config in arcConfigs) {
      final paint = Paint()
        ..color = config.color.withValues(alpha: config.opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = config.width
        ..strokeCap = StrokeCap.round;

      // Draw large smooth ellipse / circle arc
      final rect = Rect.fromCircle(center: origin, radius: config.radius);
      canvas.drawArc(rect, math.pi * 0.85, math.pi * 1.1, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
