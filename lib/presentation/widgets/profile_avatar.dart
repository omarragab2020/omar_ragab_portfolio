import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  final bool showBorder;
  final bool showOnlineBadge;
  final String? customImagePath;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.size = 50,
    this.showBorder = true,
    this.showOnlineBadge = false,
    this.customImagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = customImagePath ?? PortfolioData.profileImage;

    Widget avatarCore = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.heroGradient,
        boxShadow: showBorder
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: size * 0.25,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      padding: EdgeInsets.all(showBorder ? (size > 80 ? 4 : 2.5) : 0),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          alignment: const Alignment(0.0, -0.25),
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: size * 0.38,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    if (onTap != null) {
      avatarCore = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size),
        child: avatarCore,
      );
    }

    if (!showOnlineBadge) {
      return avatarCore;
    }

    final badgeSize = size * 0.24;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatarCore,
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            width: badgeSize,
            height: badgeSize,
            decoration: BoxDecoration(
              color: const Color(0xFF00E676),
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00E676).withValues(alpha: 0.6),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
