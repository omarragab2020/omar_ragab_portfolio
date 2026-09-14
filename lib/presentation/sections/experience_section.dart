import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/utils/responsive.dart';
import '../widgets/dev_terminal.dart';
import '../widgets/section_title.dart';
import '../widgets/timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  final bool isArabic;

  const ExperienceSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 40),
      child: Column(
        children: [
          SectionTitle(
            tag: isArabic ? "المسيرة المهنية والتيرمينال" : "Experience & Dev Terminal",
            title: isArabic
                ? "محطات الخبرة العملية ومركز الأوامر"
                : "Professional Journey & Interactive CLI",
            subtitle: isArabic
                ? "سجل الخبرات في الشركات والفرق البرمجية، بالإضافة إلى نافذة الأوامر التفاعلية (CLI) لاستكشاف مهاراتي برمجياً."
                : "Career timeline across companies and remote teams, paired with a live hacker developer console.",
            icon: Icons.timeline_rounded,
          ),
          SizedBox(height: isMobile ? 20 : 36),

          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline Column
                    Expanded(
                      flex: 6,
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
                    const SizedBox(width: 32),

                    // Interactive Terminal Column
                    const Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          DevTerminalWidget(),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    // Timeline
                    Column(
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
                    const SizedBox(height: 24),

                    // Terminal below for mobile
                    const DevTerminalWidget(),
                  ],
                ),
        ],
      ),
    );
  }
}
