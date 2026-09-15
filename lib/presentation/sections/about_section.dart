import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  final bool isArabic;

  const AboutSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 40),
      child: Column(
        children: [
          SectionTitle(
            tag: isArabic ? "من أنا" : "About Me",
            title: isArabic ? "شغف في هندسة وتطوير النظم" : "Passionate Mobile Engineer",
            subtitle: isArabic
                ? "خبرة تطبيقية متعمقة في بناء وتطوير التطبيقات التجارية بمستويات أداء متقدمة وتجربة مستخدم ساحرة."
                : "Dedicated to crafting high-performance, beautiful mobile apps with clean, scalable code.",
            icon: Icons.person_pin_rounded,
          ),
          SizedBox(height: isMobile ? 20 : 36),
          _buildHighlightsGrid(context, isDark, isMobile, isDesktop),
        ],
      ),
    );
  }

  Widget _buildHighlightsGrid(BuildContext context, bool isDark, bool isMobile, bool isDesktop) {
    final highlights = [
      {
        "icon": Icons.architecture_rounded,
        "titleEn": "Clean Architecture & SOLID",
        "titleAr": "Clean Architecture ومبادئ SOLID",
        "descEn": "Expertise in layer separation (Domain, Data, Presentation) with dependency inversion.",
        "descAr": "هيكلة معمارية مفصولة الطبقات مع سهولة الاختبار والصيانة وتوسيع النظم.",
      },
      {
        "icon": Icons.speed_rounded,
        "titleEn": "High-Performance Real-Time",
        "titleAr": "أداء فائق ونظم Real-Time",
        "descEn": "WebSocket streams, GPS live tracking, audio byte caching, and smooth 60fps UI.",
        "descAr": "تتبع خرائط مباشر، استهلاك رشيد للبطارية، ومحركات صوتية ذكية دون تهنيج.",
      },
      {
        "icon": Icons.layers_rounded,
        "titleEn": "BLoC & Cubit Mastery",
        "titleAr": "إتقان BLoC و Cubit",
        "descEn": "Strict unidirectional data flow, reactive state management, and memory leak prevention.",
        "descAr": "إدارة تدفق البيانات وتحديث الواجهات بحرية ودون إعادة بناء غير ضرورية.",
      },
      {
        "icon": Icons.verified_user_rounded,
        "titleEn": "Production-Ready & CI/CD",
        "titleAr": "جاهزية الإنتاج والـ CI/CD",
        "descEn": "Automated deployments, store releases, testing suites, and modular packages.",
        "descAr": "خبرة كاملة في نشر التطبيقات على App Store و Google Play وبناء مسارات الـ CI/CD.",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: highlights.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 4 : (isMobile ? 2 : 2),
        crossAxisSpacing: isMobile ? 10 : 16,
        mainAxisSpacing: isMobile ? 10 : 16,
        childAspectRatio: isDesktop ? 1.15 : (isMobile ? 1.05 : 1.2),
      ),
      itemBuilder: (context, index) {
        final item = highlights[index];
        return GlassContainer(
          padding: EdgeInsets.all(isMobile ? 12 : 18),
          borderRadius: isMobile ? 16 : 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 7 : 9),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  item["icon"] as IconData,
                  size: isMobile ? 18 : 22,
                  color: AppColors.primaryLight,
                ),
              ),
              SizedBox(height: isMobile ? 10 : 14),
              Text(
                isArabic ? item["titleAr"] as String : item["titleEn"] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 12.5 : 14.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  isArabic ? item["descAr"] as String : item["descEn"] as String,
                  maxLines: isMobile ? 3 : 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
