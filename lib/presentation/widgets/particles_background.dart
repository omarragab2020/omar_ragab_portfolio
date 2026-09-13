import 'dart:math' as math;
import 'package:flutter/material.dart';

class Particle {
  double x;
  double y;
  double radius;
  double speedX;
  double speedY;
  double opacity;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speedX,
    required this.speedY,
    required this.opacity,
    required this.color,
  });
}

class ParticlesBackground extends StatefulWidget {
  final Widget child;
  final bool isDark;

  const ParticlesBackground({
    super.key,
    required this.child,
    required this.isDark,
  });

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final math.Random _random = math.Random();
  final int _particleCount = 45;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _initParticles();
  }

  void _initParticles() {
    final colors = widget.isDark
        ? [
            const Color(0xFF6366F1),
            const Color(0xFF06B6D4),
            const Color(0xFF8B5CF6),
            const Color(0xFF10B981),
          ]
        : [
            const Color(0xFF818CF8),
            const Color(0xFF38BDF8),
            const Color(0xFFA78BFA),
          ];

    for (int i = 0; i < _particleCount; i++) {
      _particles.add(
        Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          radius: _random.nextDouble() * 2.5 + 1.0,
          speedX: (_random.nextDouble() - 0.5) * 0.0008,
          speedY: (_random.nextDouble() - 0.5) * 0.0008,
          opacity: _random.nextDouble() * 0.5 + 0.2,
          color: colors[_random.nextInt(colors.length)],
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isDark
                  ? const Color(0xFF6366F1).withValues(alpha: 0.12)
                  : const Color(0xFF6366F1).withValues(alpha: 0.06),
            ),
          ),
        ),
        Positioned(
          top: 400,
          right: -150,
          child: Container(
            width: 450,
            height: 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isDark
                  ? const Color(0xFF06B6D4).withValues(alpha: 0.10)
                  : const Color(0xFF06B6D4).withValues(alpha: 0.05),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isDark
                  ? const Color(0xFF8B5CF6).withValues(alpha: 0.10)
                  : const Color(0xFF8B5CF6).withValues(alpha: 0.04),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            for (var p in _particles) {
              p.x += p.speedX;
              p.y += p.speedY;

              if (p.x < 0) p.x = 1.0;
              if (p.x > 1.0) p.x = 0;
              if (p.y < 0) p.y = 1.0;
              if (p.y > 1.0) p.y = 0;
            }

            return CustomPaint(
              size: Size.infinite,
              painter: ParticlePainter(particles: _particles),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var p in particles) {
      final dx = p.x * size.width;
      final dy = p.y * size.height;

      paint.color = p.color.withValues(alpha: p.opacity);
      canvas.drawCircle(Offset(dx, dy), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
