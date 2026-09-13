import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../widgets/profile_avatar.dart';

class FooterSection extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onScrollToTop;

  const FooterSection({
    super.key,
    required this.isArabic,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.bgDarkSecondary : AppColors.bgLightSecondary,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo & Name
              Row(
                children: [
                  const ProfileAvatar(
                    size: 32,
                    showBorder: true,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isArabic ? PortfolioData.nameAr : PortfolioData.nameEn,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Scroll to Top Button
              IconButton(
                onPressed: onScrollToTop,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 18,
                    color: AppColors.primaryLight,
                  ),
                ),
                tooltip: isArabic ? "للأعلى" : "Back to top",
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(),
          const SizedBox(height: 14),

          // Copyright and Socials (Responsive layout to prevent overflow)
          if (isMobile) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isArabic
                      ? "© 2026 عمر رجب • تم التطوير بـ Flutter و Clean Architecture"
                      : "© 2026 Omar Ragab • Crafted with Flutter & Clean Architecture",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? AppColors.textDarkMuted
                        : AppColors.textLightMuted,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => UrlHelper.openGitHub(),
                      icon: const FaIcon(FontAwesomeIcons.github, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => UrlHelper.openLinkedIn(),
                      icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => UrlHelper.openWhatsApp(),
                      icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => UrlHelper.openEmail(),
                      icon: const FaIcon(FontAwesomeIcons.envelope, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    isArabic
                        ? "© 2026 عمر رجب • تم التطوير بـ Flutter و Clean Architecture"
                        : "© 2026 Omar Ragab • Crafted with Flutter & Clean Architecture",
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textDarkMuted
                          : AppColors.textLightMuted,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => UrlHelper.openGitHub(),
                      icon: const FaIcon(FontAwesomeIcons.github, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () => UrlHelper.openLinkedIn(),
                      icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () => UrlHelper.openWhatsApp(),
                      icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () => UrlHelper.openEmail(),
                      icon: const FaIcon(FontAwesomeIcons.envelope, size: 15),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
