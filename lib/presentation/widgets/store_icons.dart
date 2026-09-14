import 'package:flutter/material.dart';

/// Crisp, standalone vector icon for Google Play Store with official colors or monochrome fallback.
class GooglePlayIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final bool isMultiColor;

  const GooglePlayIcon({
    super.key,
    this.size = 16,
    this.color,
    this.isMultiColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GooglePlayPainter(
          overrideColor: color,
          isMultiColor: isMultiColor && color == null,
        ),
      ),
    );
  }
}

class _GooglePlayPainter extends CustomPainter {
  final Color? overrideColor;
  final bool isMultiColor;

  _GooglePlayPainter({
    this.overrideColor,
    required this.isMultiColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    if (!isMultiColor && overrideColor != null) {
      final paint = Paint()
        ..color = overrideColor!
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      final path = Path()
        ..moveTo(w * 0.10, h * 0.05)
        ..lineTo(w * 0.90, h * 0.50)
        ..lineTo(w * 0.10, h * 0.95)
        ..close();

      canvas.drawPath(path, paint);
      return;
    }

    // Official Google Play 4-color overlapping geometry
    // 1. Blue / Cyan Triangle (Top-Left)
    final bluePaint = Paint()
      ..color = const Color(0xFF00C3FF)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final bluePath = Path()
      ..moveTo(w * 0.10, h * 0.05)
      ..lineTo(w * 0.62, h * 0.50)
      ..lineTo(w * 0.10, h * 0.50)
      ..close();
    canvas.drawPath(bluePath, bluePaint);

    // 2. Green Triangle (Bottom-Left)
    final greenPaint = Paint()
      ..color = const Color(0xFF00E676)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final greenPath = Path()
      ..moveTo(w * 0.10, h * 0.50)
      ..lineTo(w * 0.62, h * 0.50)
      ..lineTo(w * 0.10, h * 0.95)
      ..close();
    canvas.drawPath(greenPath, greenPaint);

    // 3. Yellow / Amber Triangle (Top-Right slope)
    final yellowPaint = Paint()
      ..color = const Color(0xFFFFD500)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final yellowPath = Path()
      ..moveTo(w * 0.10, h * 0.05)
      ..lineTo(w * 0.90, h * 0.50)
      ..lineTo(w * 0.62, h * 0.50)
      ..close();
    canvas.drawPath(yellowPath, yellowPaint);

    // 4. Red / Coral Triangle (Bottom-Right slope & apex)
    final redPaint = Paint()
      ..color = const Color(0xFFFF334B)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    final redPath = Path()
      ..moveTo(w * 0.10, h * 0.95)
      ..lineTo(w * 0.90, h * 0.50)
      ..lineTo(w * 0.62, h * 0.50)
      ..close();
    canvas.drawPath(redPath, redPaint);
  }

  @override
  bool shouldRepaint(covariant _GooglePlayPainter oldDelegate) =>
      oldDelegate.overrideColor != overrideColor ||
      oldDelegate.isMultiColor != isMultiColor;
}

/// Standalone Apple Icon using Flutter's built-in Material icon
class AppleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const AppleIcon({
    super.key,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Icon(
      Icons.apple,
      size: size,
      color: color ?? (isDark ? Colors.white : Colors.black87),
    );
  }
}
