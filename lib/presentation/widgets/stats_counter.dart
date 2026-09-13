import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'glass_container.dart';

class StatsSection extends StatelessWidget {
  final bool isArabic;

  const StatsSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        "value": "2+",
        "labelEn": "Years of Experience",
        "labelAr": "سنوات من الخبرة العملية",
        "icon": Icons.work_history_rounded,
        "color": AppColors.primary,
      },
      {
        "value": "10+",
        "labelEn": "Completed Projects",
        "labelAr": "تطبيق ومشاريع منجزة",
        "icon": Icons.phone_android_rounded,
        "color": AppColors.secondary,
      },
      {
        "value": "50K+",
        "labelEn": "Active App Users",
        "labelAr": "مستخدمين نشطين للتطبيقات",
        "icon": Icons.group_rounded,
        "color": AppColors.accent,
      },
      {
        "value": "1200+",
        "labelEn": "Git Commits & Pulls",
        "labelAr": "مساهمة وكود نظيف",
        "icon": Icons.commit_rounded,
        "color": AppColors.pinkNeon,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 650;
        final isTablet = constraints.maxWidth >= 650 && constraints.maxWidth < 1000;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : (isTablet ? 2 : 4),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isMobile ? 1.2 : 1.35,
          ),
          itemBuilder: (context, index) {
            final item = stats[index];
            final color = item["color"] as Color;

            return GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item["icon"] as IconData,
                      color: color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item["value"] as String,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: color,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isArabic
                        ? item["labelAr"] as String
                        : item["labelEn"] as String,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.textDarkSecondary
                          : AppColors.textLightSecondary,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
