import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import 'glass_container.dart';

class TimelineCard extends StatefulWidget {
  final ExperienceModel experience;
  final bool isArabic;
  final bool isFirst;
  final bool isLast;

  const TimelineCard({
    super.key,
    required this.experience,
    required this.isArabic,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  bool _isHovered = false;
  bool _isExpanded = false;

  List<String> _getTechStack(String company) {
    if (company.toLowerCase().contains('nuess')) {
      return widget.experience.isCurrent
          ? ['Flutter', 'Clean Arch', 'BLoC & Cubit', 'Pusher Sync', 'SQLite', 'Maps Cluster', 'REST API']
          : ['Flutter', 'GetX', 'Firebase Auth', 'FCM', 'REST APIs', 'Multipart Upload'];
    } else {
      return ['Flutter', 'Figma to Code', 'Provider & GetX', 'Repository Pattern', 'Responsive UI'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final isCurrent = widget.experience.isCurrent;
    final techList = _getTechStack(widget.experience.companyEn);
    final highlights = widget.isArabic
        ? widget.experience.highlightsAr
        : widget.experience.highlightsEn;

    final companyInitial = widget.experience.companyEn.isNotEmpty
        ? widget.experience.companyEn.substring(0, 1).toUpperCase()
        : "C";

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -3.0 : 0.0),
        margin: EdgeInsets.only(bottom: isMobile ? 16 : 20),
        child: GlassContainer(
          padding: EdgeInsets.all(isMobile ? 16 : 22),
          borderRadius: 20,
          borderColor: isCurrent
              ? (_isHovered ? AppColors.accent : AppColors.accent.withValues(alpha: 0.5))
              : (_isHovered ? AppColors.primaryLight : null),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Creative Company Avatar Badge
                  Container(
                    width: isMobile ? 42 : 48,
                    height: isMobile ? 42 : 48,
                    decoration: BoxDecoration(
                      gradient: isCurrent
                          ? AppColors.heroGradient
                          : LinearGradient(
                              colors: isDark
                                  ? [const Color(0xFF3B82F6), const Color(0xFF8B5CF6)]
                                  : [const Color(0xFF2563EB), const Color(0xFF7C3AED)],
                            ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: (isCurrent ? AppColors.accent : AppColors.primary)
                              .withValues(alpha: _isHovered ? 0.4 : 0.25),
                          blurRadius: _isHovered ? 14 : 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        companyInitial,
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Company Name & Role
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.isArabic
                                    ? widget.experience.companyAr
                                    : widget.experience.companyEn,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  fontWeight: FontWeight.w800,
                                  color: isDark ? Colors.white : AppColors.textLightPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isCurrent) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: AppColors.accent.withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.accent,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: AppColors.accent,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.isArabic ? "الحالية" : "ACTIVE",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.accent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          widget.isArabic
                              ? widget.experience.roleAr
                              : widget.experience.roleEn,
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 14.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Period & Location Pills (Desktop / Tablet)
                  if (!isMobile)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? AppColors.accent.withValues(alpha: 0.12)
                                : (isDark
                                    ? Colors.white.withValues(alpha: 0.06)
                                    : Colors.black.withValues(alpha: 0.05)),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isCurrent
                                  ? AppColors.accent.withValues(alpha: 0.4)
                                  : (isDark ? AppColors.borderDark : AppColors.borderLight),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 11,
                                color: isCurrent ? AppColors.accent : AppColors.primaryLight,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.isArabic
                                    ? widget.experience.periodAr
                                    : widget.experience.periodEn,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: isCurrent ? AppColors.accent : (isDark ? Colors.white70 : Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 11,
                              color: isDark ? AppColors.textDarkMuted : AppColors.textLightMuted,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.isArabic
                                  ? widget.experience.locationAr
                                  : widget.experience.locationEn,
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? AppColors.textDarkMuted : AppColors.textLightMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),

              // Period & Location for Mobile
              if (isMobile) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? AppColors.accent.withValues(alpha: 0.12)
                            : (isDark
                                ? Colors.white.withValues(alpha: 0.06)
                                : Colors.black.withValues(alpha: 0.05)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 10,
                            color: isCurrent ? AppColors.accent : AppColors.primaryLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.isArabic
                                ? widget.experience.periodAr
                                : widget.experience.periodEn,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: isCurrent ? AppColors.accent : (isDark ? Colors.white70 : Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 10,
                          color: isDark ? AppColors.textDarkMuted : AppColors.textLightMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.isArabic
                              ? widget.experience.locationAr
                              : widget.experience.locationEn,
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? AppColors.textDarkMuted : AppColors.textLightMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 12),

              // Description
              Text(
                widget.isArabic
                    ? widget.experience.descriptionAr
                    : widget.experience.descriptionEn,
                style: TextStyle(
                  fontSize: isMobile ? 12.5 : 13.5,
                  color: isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary,
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 10),

              // Highlights List (Compact: 1 item by default or all if expanded)
              ...List.generate(
                _isExpanded ? highlights.length : (highlights.isNotEmpty ? 1 : 0),
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Icon(
                          Icons.check_circle_outline_rounded,
                          size: isMobile ? 13 : 15,
                          color: isCurrent ? AppColors.accent : AppColors.primaryLight,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          highlights[index],
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            color: isDark ? Colors.white70 : AppColors.textLightPrimary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Show more / less toggle button if multiple highlights exist
              if (highlights.length > 1)
                InkWell(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _isExpanded
                              ? (widget.isArabic ? "عرض أقل ▲" : "Show less ▲")
                              : (widget.isArabic
                                  ? "+ عرض باقي الإنجازات (${highlights.length - 1}) ▼"
                                  : "+ Show more highlights (${highlights.length - 1}) ▼"),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 12),

              // Tech Stack Chips
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: techList.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.primary.withValues(alpha: 0.10)
                          : AppColors.primary.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
