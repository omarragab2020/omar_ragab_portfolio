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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final isCurrent = widget.experience.isCurrent;
    final highlights = widget.isArabic
        ? widget.experience.highlightsAr
        : widget.experience.highlightsEn;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Node & Dynamic Timeline Connecting Line
          Column(
            children: [
              Container(
                width: isMobile ? 32 : 38,
                height: isMobile ? 32 : 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isCurrent
                      ? AppColors.heroGradient
                      : const LinearGradient(
                          colors: [AppColors.primary, AppColors.purpleNeon],
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: (isCurrent ? AppColors.accent : AppColors.primary)
                          .withValues(alpha: 0.45),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.briefcase,
                    size: isMobile ? 12 : 14,
                    color: Colors.white,
                  ),
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: isMobile ? 12 : 20),

          // Content Card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isMobile ? 16 : 24),
              child: GlassContainer(
                padding: EdgeInsets.all(isMobile ? 14 : 20),
                borderRadius: isMobile ? 16 : 20,
                borderColor: isCurrent ? AppColors.primaryLight : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Period Badge & Active Status
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 8 : 10,
                            vertical: isMobile ? 3 : 4,
                          ),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? AppColors.accent.withValues(alpha: 0.15)
                                : AppColors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.isArabic
                                ? widget.experience.periodAr
                                : widget.experience.periodEn,
                            style: TextStyle(
                              color: isCurrent
                                  ? AppColors.accent
                                  : AppColors.primaryLight,
                              fontSize: isMobile ? 11 : 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (isCurrent)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.isArabic ? "الحالي" : "PRESENT",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9.5,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: isMobile ? 6 : 10),

                    // Role
                    Text(
                      widget.isArabic
                          ? widget.experience.roleAr
                          : widget.experience.roleEn,
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 18,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : AppColors.textLightPrimary,
                      ),
                    ),
                    const SizedBox(height: 3),

                    // Company & Location
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 4,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.building,
                              size: 11,
                              color: isDark
                                  ? AppColors.textDarkMuted
                                  : AppColors.textLightMuted,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.isArabic
                                  ? widget.experience.companyAr
                                  : widget.experience.companyEn,
                              style: TextStyle(
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 11,
                              color: isDark
                                  ? AppColors.textDarkMuted
                                  : AppColors.textLightMuted,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.isArabic
                                  ? widget.experience.locationAr
                                  : widget.experience.locationEn,
                              style: TextStyle(
                                fontSize: isMobile ? 11.5 : 13,
                                color: isDark
                                    ? AppColors.textDarkMuted
                                    : AppColors.textLightMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: isMobile ? 8 : 12),

                    // Description
                    Text(
                      widget.isArabic
                          ? widget.experience.descriptionAr
                          : widget.experience.descriptionEn,
                      style: TextStyle(
                        fontSize: isMobile ? 12.5 : 14,
                        color: isDark
                            ? AppColors.textDarkSecondary
                            : AppColors.textLightSecondary,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: isMobile ? 6 : 10),

                    // Highlights with Show More / Show Less toggle
                    ...List.generate(
                      _isExpanded ? highlights.length : (highlights.isNotEmpty ? 1 : 0),
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Icon(
                                Icons.check_circle_outline,
                                size: isMobile ? 12 : 14,
                                color: AppColors.accent,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                highlights[index],
                                style: TextStyle(
                                  fontSize: isMobile ? 11.5 : 13,
                                  color: isDark
                                      ? AppColors.textDarkSecondary
                                      : AppColors.textLightSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Show more / less button if multiple highlights exist
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
                                        ? "+ عرض المزيد (${highlights.length - 1}) ▼"
                                        : "+ Show more (${highlights.length - 1}) ▼"),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
