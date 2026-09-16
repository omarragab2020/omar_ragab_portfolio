import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  final bool isArabic;

  const AboutSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final highlights = [
      {
        "icon": Icons.architecture_rounded,
        "titleEn": "Clean Architecture",
        "titleAr": "Clean Architecture",
        "color": const Color(0xFF6366F1),
      },
      {
        "icon": Icons.speed_rounded,
        "titleEn": "Real-Time Apps",
        "titleAr": "تطبيقات Real-Time",
        "color": const Color(0xFFF97316),
      },
      {
        "icon": Icons.layers_rounded,
        "titleEn": "BLoC & Cubit",
        "titleAr": "BLoC & Cubit",
        "color": const Color(0xFF10B981),
      },
      {
        "icon": Icons.verified_user_rounded,
        "titleEn": "CI/CD & Stores",
        "titleAr": "نشر ومتاجر",
        "color": const Color(0xFF00D2FF),
      },
      {
        "icon": Icons.offline_bolt_rounded,
        "titleEn": "Offline-First",
        "titleAr": "Offline-First",
        "color": const Color(0xFFEC4899),
      },
      {
        "icon": Icons.map_rounded,
        "titleEn": "Maps & GPS",
        "titleAr": "خرائط وـ GPS",
        "color": const Color(0xFFF59E0B),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 32),
      child: Column(
        children: [
          SectionTitle(
            tag: isArabic ? "من أنا" : "About Me",
            title: isArabic ? "شغف بهندسة التطبيقات" : "Passionate Mobile Engineer",
            subtitle: isArabic
                ? "خبرة في بناء تطبيقات تجارية عالية الأداء."
                : "Building high-performance, beautiful mobile apps.",
            icon: Icons.person_pin_rounded,
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Compact horizontal-wrap chip grid
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 8 : 10,
            runSpacing: isMobile ? 8 : 10,
            children: highlights.map((item) {
              final color = item["color"] as Color;
              return _SkillChip(
                icon: item["icon"] as IconData,
                label: isArabic ? item["titleAr"] as String : item["titleEn"] as String,
                color: color,
                isMobile: isMobile,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isMobile;

  const _SkillChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.isMobile,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isMobile ? 12 : 14,
          vertical: widget.isMobile ? 7 : 8,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.color.withValues(alpha: 0.18)
              : (isDark
                  ? AppColors.bgDarkCard.withValues(alpha: 0.7)
                  : AppColors.bgLightCard),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _hovered
                ? widget.color.withValues(alpha: 0.7)
                : widget.color.withValues(alpha: 0.25),
            width: 1.2,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.25),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon,
                size: widget.isMobile ? 13 : 15, color: widget.color),
            const SizedBox(width: 6),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: widget.isMobile ? 12 : 13,
                fontWeight: FontWeight.w600,
                color: _hovered
                    ? widget.color
                    : (isDark
                        ? AppColors.textDarkSecondary
                        : AppColors.textLightSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
