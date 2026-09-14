import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import 'glass_container.dart';

class SkillCard extends StatefulWidget {
  final SkillModel skill;
  final bool isArabic;

  const SkillCard({
    super.key,
    required this.skill,
    this.isArabic = false,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final skill = widget.skill;
    final brandColor = skill.color;

    final isMobile = MediaQuery.of(context).size.width < 650;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0.0, -5.0, 0.0)
            : Matrix4.identity(),
        child: GlassContainer(
          borderRadius: isMobile ? 14 : 18,
          borderColor: _isHovered
              ? brandColor.withValues(alpha: 0.8)
              : (isDark
                  ? AppColors.borderDark.withValues(alpha: 0.7)
                  : AppColors.borderLight),
          shadows: [
            BoxShadow(
              color: _isHovered
                  ? brandColor.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
              blurRadius: _isHovered ? 16 : 8,
              offset: Offset(0, _isHovered ? 6 : 3),
            ),
          ],
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 14,
            vertical: isMobile ? 10 : 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Icon + Name + Proficiency Badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Brand Icon Container
                  Container(
                    width: isMobile ? 28 : 36,
                    height: isMobile ? 28 : 36,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          brandColor.withValues(alpha: 0.25),
                          brandColor.withValues(alpha: 0.08),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(isMobile ? 7 : 10),
                      border: Border.all(
                        color: brandColor.withValues(alpha: _isHovered ? 0.8 : 0.35),
                        width: 1.1,
                      ),
                      boxShadow: [
                        if (_isHovered)
                          BoxShadow(
                            color: brandColor.withValues(alpha: 0.4),
                            blurRadius: 8,
                          ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        skill.icon,
                        size: isMobile ? 14 : 18,
                        color: brandColor,
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 6 : 10),

                  // Title and Tech Tag
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          skill.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: isMobile ? 12 : 13.5,
                            color: isDark
                                ? AppColors.textDarkPrimary
                                : AppColors.textLightPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            color: brandColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            widget.isArabic ? skill.tagAr : skill.tagEn,
                            style: TextStyle(
                              fontSize: isMobile ? 8.5 : 9.5,
                              fontWeight: FontWeight.w700,
                              color: brandColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Proficiency Chip
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 5 : 7,
                      vertical: isMobile ? 2 : 3,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.bgDarkSecondary
                          : AppColors.bgLightSecondary,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                    ),
                    child: Text(
                      "${(skill.level * 100).toInt()}%",
                      style: TextStyle(
                        fontSize: isMobile ? 9.5 : 10.5,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? Colors.white
                            : AppColors.textLightPrimary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Engineering Note / Micro-Insight
              Text(
                widget.isArabic ? skill.noteAr : skill.noteEn,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11.5,
                  color: isDark
                      ? AppColors.textDarkSecondary
                      : AppColors.textLightSecondary,
                  height: 1.3,
                ),
                maxLines: isMobile ? 1 : 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: isMobile ? 4 : 8),

              // Glowing Progress Line
              Stack(
                children: [
                  Container(
                    height: isMobile ? 3 : 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: skill.level,
                    child: Container(
                      height: isMobile ? 3 : 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            brandColor.withValues(alpha: 0.6),
                            brandColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                            color: brandColor.withValues(alpha: _isHovered ? 0.7 : 0.35),
                            blurRadius: _isHovered ? 6 : 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
