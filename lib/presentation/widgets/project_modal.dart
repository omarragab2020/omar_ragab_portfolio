import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import 'store_icons.dart';

class ProjectModal extends StatefulWidget {
  final ProjectModel project;
  final bool isArabic;

  const ProjectModal({
    super.key,
    required this.project,
    required this.isArabic,
  });

  static void show(BuildContext context, ProjectModel project, bool isArabic) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => ProjectModal(project: project, isArabic: isArabic),
    );
  }

  @override
  State<ProjectModal> createState() => _ProjectModalState();
}

class _ProjectModalState extends State<ProjectModal> {
  int _selectedImageIndex = 0;
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final project = widget.project;
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    final images = project.galleryImages.isNotEmpty
        ? project.galleryImages
        : [project.imagePath];

    final tabs = widget.isArabic
        ? [
            {"label": "نظرة عامة", "icon": Icons.view_quilt_rounded},
            {"label": "المعمارية والأثر", "icon": Icons.architecture_rounded},
            {"label": "المميزات والتقنيات", "icon": Icons.bolt_rounded},
          ]
        : [
            {"label": "Overview", "icon": Icons.view_quilt_rounded},
            {"label": "Architecture", "icon": Icons.architecture_rounded},
            {"label": "Features & Tech", "icon": Icons.bolt_rounded},
          ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 40,
        vertical: isMobile ? 16 : 40,
      ),
      child: Directionality(
        textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          width: isDesktop ? 900 : double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.bgDarkCard : AppColors.bgLightCard,
            borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 14 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 8 : 10,
                                    vertical: isMobile ? 3 : 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  project.category,
                                  style: TextStyle(
                                    color: AppColors.primaryLight,
                                    fontSize: isMobile ? 10 : 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (project.isFeatured)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 6 : 8,
                                      vertical: isMobile ? 3 : 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.accent.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    widget.isArabic ? "⭐ مميز" : "⭐ Featured",
                                    style: TextStyle(
                                      color: AppColors.accent,
                                      fontSize: isMobile ? 10 : 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (project.playStoreUrl != null ||
                                  project.appStoreUrl != null)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 6 : 8,
                                      vertical: isMobile ? 3 : 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        size: isMobile ? 11 : 13,
                                        color: Colors.greenAccent,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        widget.isArabic
                                            ? "متاح في المتاجر (Live)"
                                            : "Live App",
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: isMobile ? 10 : 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.isArabic ? project.titleAr : project.titleEn,
                            style: TextStyle(
                              fontSize: isMobile ? 17 : 22,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? AppColors.textDarkPrimary
                                  : AppColors.textLightPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: isDark
                            ? AppColors.bgDarkSecondary
                            : AppColors.bgLightSecondary,
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Segmented Tabs Pill Bar
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.bgDarkSecondary
                        : AppColors.bgLightSecondary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      final isSelected = _selectedTabIndex == index;
                      final tab = tabs[index];

                      return Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedTabIndex = index),
                          borderRadius: BorderRadius.circular(10),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 7 : 9,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primary
                                            .withValues(alpha: 0.35),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  tab["icon"] as IconData,
                                  size: isMobile ? 13 : 15,
                                  color: isSelected
                                      ? Colors.white
                                      : (isDark
                                          ? AppColors.textDarkSecondary
                                          : AppColors.textLightSecondary),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    tab["label"] as String,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: isMobile ? 11 : 12.5,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 14),

                // Body Content (Switched by active tab)
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _buildActiveTabContent(
                      context,
                      isDark,
                      isMobile,
                      project,
                      images,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Footer Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_rounded, size: 16),
                      label: Text(widget.isArabic ? "رجوع" : "Back"),
                      style: TextButton.styleFrom(
                        foregroundColor: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => UrlHelper.openGitHub(),
                      icon: const FaIcon(FontAwesomeIcons.github, size: 14),
                      label: Text(
                        widget.isArabic ? "كود GitHub" : "View Code",
                        style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 14 : 18,
                          vertical: isMobile ? 9 : 11,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveTabContent(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ProjectModel project,
    List<String> images,
  ) {
    switch (_selectedTabIndex) {
      case 0:
        return _buildOverviewTab(context, isDark, isMobile, project, images);
      case 1:
        return _buildArchitectureTab(context, isDark, isMobile, project);
      case 2:
      default:
        return _buildFeaturesTab(context, isDark, isMobile, project);
    }
  }

  Widget _buildOverviewTab(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ProjectModel project,
    List<String> images,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Screenshots Section
        if (images.isNotEmpty) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: isMobile ? 180 : 260,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Image.asset(
                images[_selectedImageIndex % images.length],
                fit: BoxFit.contain,
                errorBuilder: (ctx, err, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.image_outlined,
                          size: 40, color: Colors.grey),
                      const SizedBox(height: 6),
                      Text(
                        project.titleEn,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (images.length > 1) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 8),
                itemBuilder: (ctx, index) {
                  final isSelected = index == _selectedImageIndex;
                  return InkWell(
                    onTap: () => setState(() => _selectedImageIndex = index),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image, size: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 14),
        ],

        // Description
        Text(
          widget.isArabic ? project.descriptionAr : project.descriptionEn,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14.5,
            color: isDark
                ? AppColors.textDarkSecondary
                : AppColors.textLightSecondary,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 14),

        // Live Store Buttons (if published)
        if (project.playStoreUrl != null || project.appStoreUrl != null) ...[
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              if (project.playStoreUrl != null)
                ElevatedButton.icon(
                  onPressed: () => UrlHelper.launchURL(project.playStoreUrl!),
                  icon: const GooglePlayIcon(
                    size: 15,
                  ),
                  label: Text(
                    widget.isArabic ? "Google Play" : "Google Play",
                    style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF01875F).withValues(alpha: 0.22),
                    foregroundColor: const Color(0xFF00E676),
                    side: const BorderSide(color: Color(0xFF00E676), width: 1.2),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              if (project.appStoreUrl != null)
                ElevatedButton.icon(
                  onPressed: () => UrlHelper.launchURL(project.appStoreUrl!),
                  icon: const AppleIcon(
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    widget.isArabic ? "App Store" : "App Store",
                    style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70, width: 1.2),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildArchitectureTab(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ProjectModel project,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Business & Technical Impact
        if (project.impactEn.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.accent.withValues(alpha: 0.12),
                  AppColors.primary.withValues(alpha: 0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.rocket_launch_rounded,
                      size: 16,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.isArabic
                          ? "الأثر التقني والعملي في الإنتاج"
                          : "Production & Business Impact",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  widget.isArabic ? project.impactAr : project.impactEn,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.9)
                        : AppColors.textLightPrimary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],

        // Architecture Highlights
        Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.architecture_rounded,
                    size: 16,
                    color: AppColors.primaryLight,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.isArabic
                        ? "الهندسة المعمارية والأنماط البرمجية"
                        : "Architecture & Engineering Patterns",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                widget.isArabic
                    ? project.architectureAr
                    : project.architectureEn,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  color: isDark ? Colors.white70 : AppColors.textLightSecondary,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesTab(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ProjectModel project,
  ) {
    final features = widget.isArabic ? project.featuresAr : project.featuresEn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isArabic
              ? "أهم الميزات والمواصفات التقنية"
              : "Key Architectural Features",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
        ...features.map((feat) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.check_circle,
                      size: 14,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feat,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: isDark
                            ? AppColors.textDarkPrimary
                            : AppColors.textLightPrimary,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 16),

        // Tech Stack Badges
        Text(
          widget.isArabic
              ? "التقنيات والمكتبات المستخدمة"
              : "Technologies & Libraries",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: project.techStack.map((tech) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 9 : 12,
                vertical: isMobile ? 4 : 6,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.bgDarkSecondary
                    : AppColors.bgLightSecondary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark
                      ? AppColors.borderDark
                      : AppColors.borderLight,
                ),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textDarkPrimary
                      : AppColors.textLightPrimary,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
