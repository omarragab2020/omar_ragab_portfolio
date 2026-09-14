import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../widgets/glass_container.dart';
import '../widgets/profile_avatar.dart';
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

          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildBioCard(context, isDark, isMobile),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 5,
                      child: _buildHighlightsGrid(context, isDark, isMobile),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildBioCard(context, isDark, isMobile),
                    const SizedBox(height: 16),
                    _buildHighlightsGrid(context, isDark, isMobile),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildBioCard(BuildContext context, bool isDark, bool isMobile) {
    return GlassContainer(
      padding: EdgeInsets.all(isMobile ? 16 : 26),
      borderRadius: isMobile ? 18 : 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileAvatar(
                size: isMobile ? 48 : 60,
                showOnlineBadge: true,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? PortfolioData.nameAr : PortfolioData.nameEn,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      isArabic
                          ? "Mid-Level Flutter Developer | مهندس حلول برمجية"
                          : "Mid-Level Flutter Developer | Mobile Engineer",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 18),
          Text(
            isArabic ? PortfolioData.bioAr : PortfolioData.bioEn,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14.5,
              color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
              height: 1.55,
            ),
          ),
          SizedBox(height: isMobile ? 14 : 20),
          const Divider(),
          SizedBox(height: isMobile ? 10 : 16),

          // Contact Details List
          _buildInfoRow(Icons.email_outlined, isArabic ? "البريد الإلكتروني:" : "Email:", PortfolioData.email, () => UrlHelper.openEmail(), isDark, isMobile),
          SizedBox(height: isMobile ? 8 : 12),
          _buildInfoRow(Icons.phone_outlined, isArabic ? "الهاتف / واتساب:" : "Phone / WA:", PortfolioData.phone, () => UrlHelper.openWhatsApp(), isDark, isMobile),
          SizedBox(height: isMobile ? 8 : 12),
          _buildInfoRow(Icons.school_outlined, isArabic ? "التعليم الجامعي:" : "Education:", isArabic ? PortfolioData.educationAr : PortfolioData.educationEn, null, isDark, isMobile),
          SizedBox(height: isMobile ? 8 : 12),
          _buildInfoRow(Icons.location_on_outlined, isArabic ? "الموقع الجغرافي:" : "Location:", isArabic ? PortfolioData.locationAr : PortfolioData.locationEn, null, isDark, isMobile),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, VoidCallback? onTap, bool isDark, bool isMobile) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(icon, size: isMobile ? 15 : 18, color: AppColors.primaryLight),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 11.5 : 13,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 11.5 : 13,
                  color: onTap != null
                      ? AppColors.primaryLight
                      : (isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary),
                  fontWeight: onTap != null ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsGrid(BuildContext context, bool isDark, bool isMobile) {
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
        crossAxisCount: 2,
        crossAxisSpacing: isMobile ? 8 : 16,
        mainAxisSpacing: isMobile ? 8 : 16,
        childAspectRatio: isMobile ? 1.3 : 1.15,
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
                padding: EdgeInsets.all(isMobile ? 6 : 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item["icon"] as IconData,
                  size: isMobile ? 16 : 20,
                  color: AppColors.primaryLight,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 12),
              Text(
                isArabic ? item["titleAr"] as String : item["titleEn"] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  isArabic ? item["descAr"] as String : item["descEn"] as String,
                  maxLines: isMobile ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isMobile ? 10.5 : 12,
                    color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                    height: 1.35,
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
