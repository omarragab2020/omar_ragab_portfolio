import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_item.dart';

class SkillsSection extends StatefulWidget {
  final bool isArabic;

  const SkillsSection({super.key, required this.isArabic});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategoryIndex = 0; // Starts with first category

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    // Direct category tabs without "All"
    final categoryTabs = PortfolioData.skillCategories.map((c) => {
          "titleEn": c.titleEn,
          "titleAr": c.titleAr,
          "icon": c.icon,
        }).toList();

    // Skills displayed for currently selected category
    final List<SkillModel> displayedSkills =
        PortfolioData.skillCategories[_selectedCategoryIndex].skills;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          SectionTitle(
            tag: widget.isArabic ? "الخبرات والمهارات" : "Technical Skills",
            title: widget.isArabic
                ? "المهارات وبنية الأنظمة البرمجية"
                : "Skills, Frameworks & Architecture",
            subtitle: widget.isArabic
                ? "تفصيل متكامل للتقنيات وأدوات إدارة الحالة، والاتصال اللحظي والأنظمة السحابية المعتمدة في مشاريعي."
                : "A categorized deep-dive into the mobile frameworks, state machines, real-time engines, and DevOps pipelines I master.",
            icon: Icons.code_rounded,
          ),
          const SizedBox(height: 32),

          // Core Superpowers Banner (4 Pillars)
          _buildSuperpowersRow(context, isDark, isDesktop, isMobile),
          const SizedBox(height: 36),

          // Interactive Category Filter Tabs (responsive & uniform width)
          LayoutBuilder(
            builder: (context, filterConstraints) {
              final isNarrow = filterConstraints.maxWidth < 650;

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: List.generate(categoryTabs.length, (index) {
                  final tab = categoryTabs[index];
                  final isSelected = _selectedCategoryIndex == index;

                  return SizedBox(
                    width: isNarrow ? double.infinity : null,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: EdgeInsets.symmetric(
                          horizontal: isNarrow ? 14 : 16,
                          vertical: isNarrow ? 10 : 9,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primaryDark,
                                  ],
                                )
                              : null,
                          color: isSelected
                              ? null
                              : (isDark
                                  ? AppColors.bgDarkCard
                                  : AppColors.bgLightCard),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : (isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight),
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisSize:
                              isNarrow ? MainAxisSize.max : MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              tab["icon"] as IconData,
                              size: 15,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primaryLight,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                widget.isArabic
                                    ? tab["titleAr"] as String
                                    : tab["titleEn"] as String,
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : (isDark
                                          ? AppColors.textDarkSecondary
                                          : AppColors.textLightSecondary),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 24),

          // Skill Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 650;
              final isMedium =
                  constraints.maxWidth >= 650 && constraints.maxWidth < 1050;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedSkills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isNarrow ? 1 : (isMedium ? 2 : 3),
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: isNarrow ? 2.65 : (isMedium ? 2.1 : 1.95),
                ),
                itemBuilder: (context, index) {
                  return SkillCard(
                    skill: displayedSkills[index],
                    isArabic: widget.isArabic,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuperpowersRow(BuildContext context, bool isDark,
      bool isDesktop, bool isMobile) {
    final pillars = [
      {
        "titleEn": "Clean Architecture",
        "titleAr": "Clean Architecture",
        "descEn": "SOLID principles & 100% testable domain layers.",
        "descAr": "مبادئ SOLID وفصل طبقات الدومين والبيانات.",
        "icon": Icons.architecture_rounded,
        "color": const Color(0xFF6366F1),
      },
      {
        "titleEn": "Real-Time Systems",
        "titleAr": "نظم Real-Time",
        "descEn": "Live WebSocket & Pusher stream sync.",
        "descAr": "تتبع خرائط وأحداث لحظية عبر WebSockets و Pusher.",
        "icon": Icons.sensors_rounded,
        "color": const Color(0xFFF97316),
      },
      {
        "titleEn": "Offline-First",
        "titleAr": "أداء Offline-First",
        "descEn": "Fast local Isar & Hive caching engine.",
        "descAr": "كاش محلي فائق السرعة عبر Hive و SQLite.",
        "icon": Icons.offline_bolt_rounded,
        "color": const Color(0xFF10B981),
      },
      {
        "titleEn": "Store Production",
        "titleAr": "جاهزية المتاجر",
        "descEn": "Automated Google Play & App Store releases.",
        "descAr": "نشر معتمد على المتاجر مع أتمتة CI/CD.",
        "icon": Icons.storefront_rounded,
        "color": const Color(0xFF00D2FF),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 650;
        final isMedium =
            constraints.maxWidth >= 650 && constraints.maxWidth < 1050;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pillars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isNarrow ? 2 : (isMedium ? 2 : 4),
            crossAxisSpacing: isNarrow ? 8 : 12,
            mainAxisSpacing: isNarrow ? 8 : 12,
            childAspectRatio: isNarrow ? 1.55 : (isMedium ? 2.3 : 1.65),
          ),
          itemBuilder: (context, index) {
            final p = pillars[index];
            final color = p["color"] as Color;

            return GlassContainer(
              padding: EdgeInsets.all(isNarrow ? 10 : 14),
              borderColor: color.withValues(alpha: 0.35),
              borderRadius: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isNarrow ? 6 : 7),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: color.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          p["icon"] as IconData,
                          size: isNarrow ? 15 : 17,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.isArabic
                              ? p["titleAr"] as String
                              : p["titleEn"] as String,
                          style: TextStyle(
                            fontSize: isNarrow ? 12 : 13.5,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : AppColors.textLightPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.isArabic
                        ? p["descAr"] as String
                        : p["descEn"] as String,
                    style: TextStyle(
                      fontSize: isNarrow ? 10.5 : 11.5,
                      color: isDark
                          ? AppColors.textDarkSecondary
                          : AppColors.textLightSecondary,
                      height: 1.25,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
