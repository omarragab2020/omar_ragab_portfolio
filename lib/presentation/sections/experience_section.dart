import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  final bool isArabic;

  const ExperienceSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 44),
      child: Column(
        children: [
          SectionTitle(
            tag: isArabic ? "المسيرة المهنية والشركات" : "Career & Work Experience",
            title: isArabic
                ? "محطات الخبرة العملية والشركات"
                : "Professional Journey & Work Experience",
            subtitle: isArabic
                ? "سجل محطات العمل وتطوير التطبيقات التجارية وحلول الـ Enterprise مع فرق العمل والشركات التقنية."
                : "Track record of engineering high-performance commercial apps, real-time architectures, and enterprise systems.",
            icon: Icons.business_center_rounded,
          ),
          SizedBox(height: isMobile ? 20 : 36),

          // Centered, compact container for experience cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 880),
            child: Column(
              children: List.generate(
                PortfolioData.experiences.length,
                (index) => TimelineCard(
                  experience: PortfolioData.experiences[index],
                  isArabic: isArabic,
                  isFirst: index == 0,
                  isLast: index == PortfolioData.experiences.length - 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
