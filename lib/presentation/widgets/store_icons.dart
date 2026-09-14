import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Crisp vector icon for Google Play Store with official 4-color geometry or monochrome icon.
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
    if (!isMultiColor && color != null) {
      return FaIcon(
        FontAwesomeIcons.googlePlay,
        size: size,
        color: color,
      );
    }

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
        ..moveTo(w * 0.12, h * 0.06)
        ..lineTo(w * 0.88, h * 0.50)
        ..lineTo(w * 0.12, h * 0.94)
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

/// Standalone Apple Icon drawn directly via vector CustomPainter (100% reliable on web without font dependencies)
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
    final iconColor = color ?? (isDark ? Colors.white : Colors.black87);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ApplePainter(color: iconColor),
      ),
    );
  }
}

class _ApplePainter extends CustomPainter {
  final Color color;

  _ApplePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final w = size.width;
    final h = size.height;

    // 1. Apple Leaf (Top)
    final leafPath = Path();
    leafPath.moveTo(w * 0.54, h * 0.19);
    leafPath.cubicTo(w * 0.54, h * 0.10, w * 0.61, h * 0.01, w * 0.72, 0.0);
    leafPath.cubicTo(w * 0.73, h * 0.09, w * 0.66, h * 0.18, w * 0.54, h * 0.19);
    leafPath.close();
    canvas.drawPath(leafPath, paint);

    // 2. Apple Body with standard bite cutout
    final bodyPath = Path();
    bodyPath.moveTo(w * 0.88, h * 0.74);
    bodyPath.cubicTo(w * 0.83, h * 0.85, w * 0.77, h * 0.95, w * 0.68, h * 0.95);
    bodyPath.cubicTo(w * 0.60, h * 0.95, w * 0.56, h * 0.89, w * 0.47, h * 0.89);
    bodyPath.cubicTo(w * 0.38, h * 0.89, w * 0.34, h * 0.95, w * 0.26, h * 0.95);
    bodyPath.cubicTo(w * 0.17, h * 0.95, w * 0.11, h * 0.84, w * 0.06, h * 0.74);
    bodyPath.cubicTo(w * 0.01, h * 0.53, 0.0, h * 0.38, w * 0.08, h * 0.28);
    bodyPath.cubicTo(w * 0.15, h * 0.19, w * 0.26, h * 0.19, w * 0.35, h * 0.21);
    bodyPath.cubicTo(w * 0.44, h * 0.23, w * 0.51, h * 0.19, w * 0.58, h * 0.19);
    bodyPath.cubicTo(w * 0.67, h * 0.19, w * 0.76, h * 0.24, w * 0.81, h * 0.30);
    // Right side bite curve
    bodyPath.cubicTo(w * 0.72, h * 0.36, w * 0.72, h * 0.49, w * 0.80, h * 0.55);
    bodyPath.cubicTo(w * 0.85, h * 0.59, w * 0.91, h * 0.61, w * 0.94, h * 0.62);
    bodyPath.cubicTo(w * 0.92, h * 0.66, w * 0.90, h * 0.70, w * 0.88, h * 0.74);
    bodyPath.close();

    canvas.drawPath(bodyPath, paint);
  }

  @override
  bool shouldRepaint(covariant _ApplePainter oldDelegate) =>
      oldDelegate.color != color;
}
