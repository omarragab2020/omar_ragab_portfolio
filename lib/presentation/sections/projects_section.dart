import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/portfolio_controller.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  final bool isArabic;

  const ProjectsSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final projects = controller.filteredProjects;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final categories = [
      {"key": "All", "labelEn": "All Projects (9)", "labelAr": "كل المشاريع (9)"},
      {"key": "Delivery", "labelEn": "Delivery & Logistics", "labelAr": "التوصيل واللوجستيات"},
      {"key": "Real-time", "labelEn": "Booking & Real-time", "labelAr": "الحجوزات و Real-time"},
      {"key": "E-commerce", "labelEn": "E-Commerce & Deals", "labelAr": "التجارة والعروض"},
      {"key": "Education", "labelEn": "EdTech Platforms", "labelAr": "المنصات التعليمية"},
      {"key": "Islamic", "labelEn": "Islamic & Quran", "labelAr": "التطبيقات الإسلامية"},
      {"key": "Tools", "labelEn": "Productivity & Maps", "labelAr": "الأدوات والخرائط"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          SectionTitle(
            tag: isArabic ? "معرض الأعمال" : "Portfolio Showcase",
            title: isArabic
                ? "مشاريع وتطبيقات عملية قوية"
                : "Featured Production Applications",
            subtitle: isArabic
                ? "مجموعة مختارة من التطبيقات التي قمت ببنائها وهندستها بأعلى معايير الأداء وتجربة المستخدم وقابلية التوسع."
                : "Explore production-grade Flutter apps with real-time architectures, complex state management, and seamless UX.",
            icon: Icons.layers_rounded,
          ),
          const SizedBox(height: 28),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 10,
            children: categories.map((cat) {
              final isSelected = controller.selectedCategory == cat["key"];

              return FilterChip(
                selected: isSelected,
                label: Text(
                  isArabic ? cat["labelAr"]! : cat["labelEn"]!,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : (isDark
                            ? AppColors.textDarkSecondary
                            : AppColors.textLightSecondary),
                  ),
                ),
                selectedColor: AppColors.primary,
                backgroundColor: isDark
                    ? AppColors.bgDarkCard
                    : AppColors.bgLightCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected
                        ? AppColors.primary
                        : (isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight),
                  ),
                ),
                onSelected: (_) {
                  controller.setSelectedCategory(cat["key"]!);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 32),

          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 680;
              final isTablet = constraints.maxWidth >= 680 && constraints.maxWidth < 1050;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isMobile ? 0.88 : (isTablet ? 0.80 : 0.80),
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: projects[index],
                    isArabic: isArabic,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
