import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../controllers/portfolio_controller.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import 'profile_avatar.dart';

class NavBar extends StatelessWidget {
  final Function(int) onSectionSelected;

  const NavBar({
    super.key,
    required this.onSectionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final isDark = controller.isDarkMode;
    final isAr = controller.isArabic;

    final navItems = isAr
        ? ["الرئيسية", "عني", "المهارات", "المشاريع", "الخبرات", "التواصل"]
        : ["Home", "About", "Skills", "Projects", "Experience", "Contact"];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.bgDark.withValues(alpha: 0.8)
                : AppColors.bgLight.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? AppColors.borderDark.withValues(alpha: 0.6)
                    : AppColors.borderLight,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // Logo / Brand with Avatar
              InkWell(
                onTap: () => onSectionSelected(0),
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    const ProfileAvatar(
                      size: 38,
                      showOnlineBadge: true,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isAr ? PortfolioData.nameAr : PortfolioData.nameEn,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : AppColors.textLightPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Desktop Navigation Items with active indicators
              if (Responsive.isDesktop(context)) ...[
                Row(
                  children: List.generate(navItems.length, (index) {
                    final isActive = controller.activeNavIndex == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () => onSectionSelected(index),
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary.withValues(alpha: 0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isActive
                                  ? AppColors.primary.withValues(alpha: 0.4)
                                  : Colors.transparent,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                navItems[index],
                                style: TextStyle(
                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 13.5,
                                  color: isActive
                                      ? AppColors.primaryLight
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
                const SizedBox(width: 12),
              ],

              // Language Toggle
              IconButton(
                onPressed: () => controller.toggleLanguage(),
                icon: Text(
                  isAr ? "EN" : "عربي",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.primaryLight,
                  ),
                ),
                tooltip: isAr ? "Switch to English" : "التحويل للعربية",
                style: IconButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.bgDarkSecondary
                      : AppColors.bgLightSecondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),
              ),
              const SizedBox(width: 8),

              // Dark/Light Theme Toggle
              IconButton(
                onPressed: () => controller.toggleTheme(),
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  size: 18,
                  color: isDark ? Colors.amber : AppColors.primary,
                ),
                tooltip: isDark ? "Light Mode" : "Dark Mode",
                style: IconButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.bgDarkSecondary
                      : AppColors.bgLightSecondary,
                ),
              ),
              const SizedBox(width: 8),

              // Hire Me / CV Button
              ElevatedButton.icon(
                onPressed: () => UrlHelper.openWhatsApp(),
                icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 15),
                label: Text(
                  isAr ? "تواصل" : "Hire Me",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
