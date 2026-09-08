import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/extensions/localization.dart';
import '../theme/theme.dart';

/// Betopia AI official brand logo with optional BETA badge.
class BetopiaLogo extends StatelessWidget {
  const BetopiaLogo({
    super.key,
    this.fontSize = 22,
    this.iconSize = 28,
    this.showBadge = true,
  });

  final double fontSize;
  final double iconSize;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Stylized 'b' brand icon
        BetopiaIcon(
          size: iconSize,
          primaryColor: context.color.primary.defaultValue,
          strokeColor: context.color.text.defaultValue,
        ),
        const Gap(10),
        // Brand name
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
              color: context.color.text.defaultValue,
              fontFamily: 'Inter',
            ),
            children: [
              const TextSpan(text: 'Betopia'),
              TextSpan(
                text: 'AI',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: context.color.text.defaultValue,
                ),
              ),
            ],
          ),
        ),
        if (showBadge) ...[
          const Gap(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
            decoration: BoxDecoration(
              color: context.color.border.defaultValue,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: context.color.border.subtle,
                width: 0.8,
              ),
            ),
            child: Text(
              context.locale.beta,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: context.color.text.muted,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Standalone Betopia symbol / icon mark.
class BetopiaIcon extends StatelessWidget {
  const BetopiaIcon({
    super.key,
    required this.size,
    this.primaryColor,
    this.strokeColor,
  });

  final double size;
  final Color? primaryColor;
  final Color? strokeColor;

  @override
  Widget build(BuildContext context) {
    final primary = primaryColor ?? context.color.primary.defaultValue;
    final stroke = strokeColor ?? context.color.text.defaultValue;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BetopiaIconPainter(
          primaryColor: primary,
          strokeColor: stroke,
        ),
      ),
    );
  }
}

class _BetopiaIconPainter extends CustomPainter {
  const _BetopiaIconPainter({
    required this.primaryColor,
    required this.strokeColor,
  });

  final Color primaryColor;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Stroke paint for the outline loop
    final strokePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    // Draw stylized modern 'b' shape
    final path = Path();
    // Vertical stem
    path.moveTo(w * 0.35, h * 0.12);
    path.lineTo(w * 0.35, h * 0.88);

    // Loop of the 'b'
    final loopRect = Rect.fromCircle(
      center: Offset(w * 0.58, h * 0.60),
      radius: w * 0.28,
    );
    path.arcTo(loopRect, 3.14159 * 0.8, 3.14159 * 1.8, false);

    canvas.drawPath(path, strokePaint);

    // Small orange accent dot inside
    canvas.drawCircle(Offset(w * 0.58, h * 0.60), w * 0.09, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _BetopiaIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor ||
      oldDelegate.strokeColor != strokeColor;
}
