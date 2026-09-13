import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import 'glass_container.dart';
import 'project_modal.dart';

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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0.0, -8.0, 0.0)
            : Matrix4.identity(),
        child: GlassContainer(
          borderRadius: 20,
          borderColor: _isHovered
              ? project.primaryColor.withValues(alpha: 0.8)
              : (isDark ? AppColors.borderDark : AppColors.borderLight),
          shadows: [
            BoxShadow(
              color: _isHovered
                  ? project.primaryColor.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
              blurRadius: _isHovered ? 24 : 12,
              offset: Offset(0, _isHovered ? 12 : 6),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image / Banner
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Container(
                      height: 160,
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
                                    size: 48,
                                    color: project.primaryColor
                                        .withValues(alpha: 0.6),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Icon(
                                project.icon,
                                size: 48,
                                color: project.primaryColor
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                    ),
                  ),

                  // Category Badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Text(
                        project.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Featured or Live Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (project.playStoreUrl != null ||
                            project.appStoreUrl != null)
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C853),
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
                                const Icon(Icons.check,
                                    size: 10, color: Colors.white),
                                const SizedBox(width: 3),
                                Text(
                                  widget.isArabic ? "لايف" : "LIVE",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (project.isFeatured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
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
                                fontSize: 10,
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Subtitle
                      Text(
                        widget.isArabic ? project.titleAr : project.titleEn,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textDarkPrimary
                              : AppColors.textLightPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.isArabic
                            ? project.subtitleAr
                            : project.subtitleEn,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: project.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Description
                      Expanded(
                        child: Text(
                          widget.isArabic
                              ? project.descriptionAr
                              : project.descriptionEn,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: isDark
                                ? AppColors.textDarkSecondary
                                : AppColors.textLightSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Tech Badges
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: project.techStack.take(3).map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
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
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textDarkPrimary
                                    : AppColors.textLightPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 8),

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
                              icon: const Icon(Icons.photo_library_outlined,
                                  size: 15),
                              label: Text(
                                widget.isArabic
                                    ? "تفاصيل وصور"
                                    : "Screens & Details",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: project.primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          if (project.playStoreUrl != null)
                            IconButton(
                              onPressed: () {
                                UrlHelper.launchURL(project.playStoreUrl!);
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.googlePlay,
                                size: 14,
                                color: Color(0xFF00E676),
                              ),
                              tooltip: "Google Play",
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(5),
                              ),
                            ),
                          if (project.appStoreUrl != null)
                            IconButton(
                              onPressed: () {
                                UrlHelper.launchURL(project.appStoreUrl!);
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                                size: 16,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                              tooltip: "App Store",
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(5),
                              ),
                            ),
                          IconButton(
                            onPressed: () {
                              UrlHelper.openGitHub();
                            },
                            icon: const FaIcon(FontAwesomeIcons.github, size: 15),
                            tooltip: "GitHub Code",
                            style: IconButton.styleFrom(
                              foregroundColor: isDark
                                  ? AppColors.textDarkSecondary
                                  : AppColors.textLightSecondary,
                              padding: const EdgeInsets.all(5),
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
