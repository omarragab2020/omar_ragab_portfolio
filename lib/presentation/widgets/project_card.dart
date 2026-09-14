import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import 'glass_container.dart';
import 'project_modal.dart';
import 'store_icons.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool isArabic;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isArabic,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final project = widget.project;

    final isMobile = MediaQuery.of(context).size.width < 680;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0.0, -6.0, 0.0)
            : Matrix4.identity(),
        child: GlassContainer(
          borderRadius: isMobile ? 16 : 20,
          borderColor: _isHovered
              ? project.primaryColor.withValues(alpha: 0.8)
              : (isDark ? AppColors.borderDark : AppColors.borderLight),
          shadows: [
            BoxShadow(
              color: _isHovered
                  ? project.primaryColor.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image / Banner
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(isMobile ? 16 : 20),
                    ),
                    child: Container(
                      height: isMobile ? 135 : 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: project.primaryColor.withValues(alpha: 0.12),
                      ),
                      child: project.imagePath.isNotEmpty
                          ? Image.asset(
                              project.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    project.icon,
                                    size: isMobile ? 38 : 48,
                                    color: project.primaryColor
                                        .withValues(alpha: 0.6),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Icon(
                                project.icon,
                                size: isMobile ? 38 : 48,
                                color: project.primaryColor
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                    ),
                  ),

                  // Category Badge
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 10,
                        vertical: isMobile ? 3 : 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        project.category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 10 : 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Featured or Live Badge
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (project.playStoreUrl != null ||
                            project.appStoreUrl != null)
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3.5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00C853), Color(0xFF009688)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF00C853)
                                      .withValues(alpha: 0.4),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (project.playStoreUrl != null)
                                  const Padding(
                                    padding: EdgeInsets.only(right: 3),
                                    child: GooglePlayIcon(
                                      size: 10,
                                      isMultiColor: false,
                                      color: Colors.white,
                                    ),
                                  ),
                                if (project.appStoreUrl != null)
                                  const Padding(
                                    padding: EdgeInsets.only(right: 3),
                                    child: AppleIcon(
                                      size: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                Text(
                                  widget.isArabic ? "متاح بالمتجر" : "ON STORE",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (project.isFeatured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.accent, Colors.orangeAccent],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.accent.withValues(alpha: 0.4),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Text(
                              widget.isArabic ? "مميز ⭐" : "⭐ Featured",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 12 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Subtitle
                      Text(
                        widget.isArabic ? project.titleAr : project.titleEn,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 17,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textDarkPrimary
                              : AppColors.textLightPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.isArabic
                            ? project.subtitleAr
                            : project.subtitleEn,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: project.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: isMobile ? 6 : 10),

                      // Description with clean line clamping
                      Text(
                        widget.isArabic
                            ? project.descriptionAr
                            : project.descriptionEn,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isMobile ? 11.5 : 12.5,
                          color: isDark
                              ? AppColors.textDarkSecondary
                              : AppColors.textLightSecondary,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 12),

                      // Tech Badges
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          ...project.techStack.take(3).map((tech) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 6 : 8,
                                vertical: isMobile ? 2.5 : 3.5,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.bgDarkSecondary
                                    : AppColors.bgLightSecondary,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isDark
                                      ? AppColors.borderDark
                                      : AppColors.borderLight,
                                ),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: isMobile ? 9.5 : 10.5,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? AppColors.textDarkPrimary
                                      : AppColors.textLightPrimary,
                                ),
                              ),
                            );
                          }),
                          if (project.techStack.length > 3)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 5 : 6,
                                vertical: isMobile ? 2.5 : 3.5,
                              ),
                              decoration: BoxDecoration(
                                color: project.primaryColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "+${project.techStack.length - 3}",
                                style: TextStyle(
                                  fontSize: isMobile ? 9.5 : 10.5,
                                  fontWeight: FontWeight.bold,
                                  color: project.primaryColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      const Divider(height: 1),
                      SizedBox(height: isMobile ? 4 : 8),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {
                                ProjectModal.show(
                                  context,
                                  project,
                                  widget.isArabic,
                                );
                              },
                              icon: Icon(Icons.photo_library_outlined,
                                  size: isMobile ? 14 : 16),
                              label: Text(
                                widget.isArabic
                                    ? "تفاصيل وصور"
                                    : "Screens & Details",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: isMobile ? 11 : 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: project.primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          if (project.playStoreUrl != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: IconButton(
                                onPressed: () {
                                  UrlHelper.launchURL(project.playStoreUrl!);
                                },
                                icon: const GooglePlayIcon(size: 15),
                                tooltip: "Google Play Store",
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: const Color(0xFF01875F)
                                      .withValues(alpha: 0.12),
                                ),
                              ),
                            ),
                          if (project.appStoreUrl != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: IconButton(
                                onPressed: () {
                                  UrlHelper.launchURL(project.appStoreUrl!);
                                },
                                icon: AppleIcon(
                                  size: 16,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                                tooltip: "Apple App Store",
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: (isDark
                                          ? Colors.white
                                          : Colors.black)
                                      .withValues(alpha: 0.08),
                                ),
                              ),
                            ),
                          IconButton(
                            onPressed: () {
                              UrlHelper.openGitHub();
                            },
                            icon: FaIcon(FontAwesomeIcons.github, size: isMobile ? 14 : 16),
                            tooltip: "GitHub Code",
                            style: IconButton.styleFrom(
                              foregroundColor: isDark
                                  ? AppColors.textDarkSecondary
                                  : AppColors.textLightSecondary,
                              padding: const EdgeInsets.all(4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
