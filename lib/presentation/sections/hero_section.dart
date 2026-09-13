import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../widgets/glass_container.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/stats_counter.dart';

class HeroSection extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;

  const HeroSection({
    super.key,
    required this.isArabic,
    required this.onViewProjects,
    required this.onContactMe,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroInfo(context, isDark),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 4,
                      child: _buildHeroCard(context, isDark),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildHeroCard(context, isDark),
                    const SizedBox(height: 36),
                    _buildHeroInfo(context, isDark),
                  ],
                ),

          const SizedBox(height: 50),

          StatsSection(isArabic: isArabic),
        ],
      ),
    );
  }

  Widget _buildHeroInfo(BuildContext context, bool isDark) {
    final titlesList = isArabic
        ? [
            "مطور تطبيقات Flutter محترف 🚀",
            "خبير إدارة الحالة BLoC & Cubit ⚡",
            "مهندس نظم التوصيل والـ Real-time 📍",
            "مطور كود نظيف وهيكلة قابلة للتوسع 🛠️",
          ]
        : [
            "Mid-Level Flutter Mobile Engineer 🚀",
            "State Management Specialist (BLoC/Cubit) ⚡",
            "Real-time & Live Tracking Architect 📍",
            "Clean Architecture & Modular Code Pro 🛠️",
          ];

    final isDesktop = Responsive.isDesktop(context);

    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.accent.withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                isArabic
                    ? "متاح للعمل (Full-time & Remote Projects)"
                    : "Available for Full-time & Remote Roles",
                style: const TextStyle(
                  color: AppColors.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        Text(
          isArabic ? "مرحباً، أنا" : "Hello World, I'm",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark
                ? AppColors.textDarkSecondary
                : AppColors.textLightSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),

        // Name with Avatar next to it
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileAvatar(
              size: 58,
              showOnlineBadge: true,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    AppColors.heroGradient.createShader(bounds),
                child: Text(
                  isArabic ? PortfolioData.nameAr : PortfolioData.nameEn,
                  style: TextStyle(
                    fontSize: isDesktop ? 46 : 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1,
                    height: 1.1,
                  ),
                  textAlign:
                      isDesktop ? TextAlign.start : TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        SizedBox(
          height: 38,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: titlesList.map((t) {
              return TypewriterAnimatedText(
                t,
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
                speed: const Duration(milliseconds: 60),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 14),

        Text(
          isArabic ? PortfolioData.bioAr : PortfolioData.bioEn,
          style: TextStyle(
            fontSize: 15,
            color: isDark
                ? AppColors.textDarkSecondary
                : AppColors.textLightSecondary,
            height: 1.6,
          ),
          textAlign:
              isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 28),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          alignment:
              isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onViewProjects,
              icon: const Icon(Icons.rocket_launch_rounded, size: 18),
              label: Text(
                  isArabic ? "استعراض المشاريع (9)" : "Explore Projects (9)"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: AppColors.primary.withValues(alpha: 0.5),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContactMe,
              icon: const FaIcon(FontAwesomeIcons.paperPlane, size: 16),
              label: Text(isArabic ? "تواصل معي الآن" : "Let's Connect"),
              style: OutlinedButton.styleFrom(
                foregroundColor:
                    isDark ? Colors.white : AppColors.textLightPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                side: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        Row(
          mainAxisAlignment:
              isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
                FontAwesomeIcons.github, () => UrlHelper.openGitHub()),
            const SizedBox(width: 12),
            _buildSocialIcon(
                FontAwesomeIcons.linkedinIn, () => UrlHelper.openLinkedIn()),
            const SizedBox(width: 12),
            _buildSocialIcon(
                FontAwesomeIcons.whatsapp, () => UrlHelper.openWhatsApp()),
            const SizedBox(width: 12),
            _buildSocialIcon(
                FontAwesomeIcons.envelope, () => UrlHelper.openEmail()),
            const SizedBox(width: 12),
            _buildSocialIcon(
                FontAwesomeIcons.phone, () => UrlHelper.openCall()),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(FaIconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        child: Center(
          child: FaIcon(icon, size: 16, color: AppColors.primaryLight),
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context, bool isDark) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.heroGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),

          GlassContainer(
            width: 280,
            height: 280,
            borderRadius: 140,
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfileAvatar(
                  size: 130,
                  showOnlineBadge: true,
                ),
                const SizedBox(height: 12),
                Text(
                  isArabic ? PortfolioData.nameAr : PortfolioData.nameEn,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isArabic
                        ? "Mid-Level Flutter Developer"
                        : "Mid-Level Flutter Developer",
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on,
                        size: 12, color: AppColors.accent),
                    const SizedBox(width: 4),
                    Text(
                      isArabic ? "مصر (Egypt)" : "Egypt",
                      style: TextStyle(
                        fontSize: 11,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
