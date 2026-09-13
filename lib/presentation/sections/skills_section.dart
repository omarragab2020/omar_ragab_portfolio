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

          // Interactive Category Filter Tabs (without "All")
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(categoryTabs.length, (index) {
                final tab = categoryTabs[index];
                final isSelected = _selectedCategoryIndex == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9,
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
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tab["icon"] as IconData,
                            size: 15,
                            color: isSelected
                                ? Colors.white
                                : AppColors.primaryLight,
                          ),
                          const SizedBox(width: 8),
                          Text(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 28),

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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isNarrow ? 1.85 : (isMedium ? 1.75 : 1.70),
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
        "descEn": "Strict Domain, UseCase & Data separation with 100% testability.",
        "descAr": "فصل طبقات الدومين والبيانات بمبادئ SOLID لسهولة الفحص والتطوير.",
        "icon": Icons.architecture_rounded,
        "color": const Color(0xFF6366F1),
      },
      {
        "titleEn": "Real-Time Systems",
        "titleAr": "نظم Real-Time",
        "descEn": "WebSocket streams, Pusher channels & GPS live pinging.",
        "descAr": "تتبع خرائط وأحداث طلبات حية وفورية عبر Streams و WebSockets.",
        "icon": Icons.sensors_rounded,
        "color": const Color(0xFFF97316),
      },
      {
        "titleEn": "Offline-First",
        "titleAr": "أداء Offline-First",
        "descEn": "High-speed Isar & Hive caching for resilient zero-net UX.",
        "descAr": "كاش محلي سريع جداً يضمن تشغيل التطبيق بالكامل بدون إنترنت.",
        "icon": Icons.offline_bolt_rounded,
        "color": const Color(0xFF10B981),
      },
      {
        "titleEn": "Store Production",
        "titleAr": "جاهزية الإنتاج",
        "descEn": "Google Play & App Store CI/CD releases with zero-crash policy.",
        "descAr": "نشر فعلي معتمد على المتاجر مع سياسة أخطاء صارمة وأتمتة النشر.",
        "icon": Icons.storefront_rounded,
        "color": const Color(0xFF00D2FF),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final count = constraints.maxWidth < 650
            ? 1
            : (constraints.maxWidth < 1050 ? 2 : 4);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pillars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: count == 1 ? 2.8 : (count == 2 ? 2.2 : 1.45),
          ),
          itemBuilder: (context, index) {
            final p = pillars[index];
            final color = p["color"] as Color;

            return GlassContainer(
              padding: const EdgeInsets.all(16),
              borderColor: color.withValues(alpha: 0.35),
              borderRadius: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          p["icon"] as IconData,
                          size: 18,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.isArabic
                              ? p["titleAr"] as String
                              : p["titleEn"] as String,
                          style: TextStyle(
                            fontSize: 14,
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
                  const SizedBox(height: 10),
                  Text(
                    widget.isArabic
                        ? p["descAr"] as String
                        : p["descEn"] as String,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: isDark
                          ? AppColors.textDarkSecondary
                          : AppColors.textLightSecondary,
                      height: 1.35,
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
