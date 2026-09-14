import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String tag;
  final dynamic icon;
  final bool isCenter;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    required this.tag,
    this.icon,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    Widget? iconWidget;
    if (icon is IconData) {
      iconWidget = Icon(icon as IconData, size: isMobile ? 12 : 14, color: AppColors.primaryLight);
    } else if (icon is FaIconData) {
      iconWidget = FaIcon(icon as FaIconData, size: isMobile ? 12 : 14, color: AppColors.primaryLight);
    }

    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tag Badge
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 14,
            vertical: isMobile ? 4 : 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconWidget != null) ...[
                iconWidget,
                SizedBox(width: isMobile ? 4 : 6),
              ],
              Text(
                tag.toUpperCase(),
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: isMobile ? 10.5 : 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: isMobile ? 0.8 : 1.2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 8 : 12),

        // Main Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFE2E8F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: Text(
            title,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 22 : 30,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : AppColors.textLightPrimary,
              letterSpacing: -0.5,
              height: 1.2,
            ),
          ),
        ),

        // Subtitle
        if (subtitle != null) ...[
          SizedBox(height: isMobile ? 6 : 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontSize: isMobile ? 13 : 15.5,
                color: isDark
                    ? AppColors.textDarkSecondary
                    : AppColors.textLightSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
        SizedBox(height: isMobile ? 10 : 14),

        // Gradient Bar
        Container(
          width: isMobile ? 45 : 60,
          height: isMobile ? 3 : 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: AppColors.heroGradient,
          ),
        ),
      ],
    );
  }
}
