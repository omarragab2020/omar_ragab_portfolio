import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/portfolio_controller.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  final bool isArabic;

  const ProjectsSection({super.key, required this.isArabic});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.90);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final projects = controller.filteredProjects;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final categories = [
      {"key": "All", "labelEn": "All (9)", "labelAr": "الكل (9)"},
      {"key": "Stores", "labelEn": "App Stores (5) 🔥", "labelAr": "متاجر التطبيقات (5) 🔥"},
      {"key": "Delivery", "labelEn": "Delivery", "labelAr": "التوصيل"},
      {"key": "Real-time", "labelEn": "Real-time", "labelAr": "الحجوزات"},
      {"key": "E-commerce", "labelEn": "E-Commerce", "labelAr": "المتاجر"},
      {"key": "Education", "labelEn": "EdTech", "labelAr": "التعليم"},
      {"key": "Islamic", "labelEn": "Islamic", "labelAr": "إسلامي"},
      {"key": "Tools", "labelEn": "Tools", "labelAr": "الأدوات"},
    ];

    final isMobileScreen = MediaQuery.of(context).size.width < 680;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobileScreen ? 20 : 36),
      child: Column(
        children: [
          SectionTitle(
            tag: widget.isArabic ? "معرض الأعمال" : "Portfolio Showcase",
            title: widget.isArabic
                ? "مشاريع وتطبيقات عملية قوية"
                : "Featured Production Applications",
            subtitle: widget.isArabic
                ? "مجموعة مختارة من التطبيقات التي قمت ببنائها وهندستها بأعلى معايير الأداء وتجربة المستخدم وقابلية التوسع."
                : "Explore production-grade Flutter apps with real-time architectures, complex state management, and seamless UX.",
            icon: Icons.layers_rounded,
          ),
          SizedBox(height: isMobileScreen ? 14 : 24),

          // Categories Filter Tabs
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobileScreen ? 4 : 6,
            runSpacing: isMobileScreen ? 6 : 8,
            children: categories.map((cat) {
              final isSelected = controller.selectedCategory == cat["key"];

              return FilterChip(
                selected: isSelected,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobileScreen ? 4 : 6,
                  vertical: isMobileScreen ? 0 : 2,
                ),
                label: Text(
                  widget.isArabic ? cat["labelAr"]! : cat["labelEn"]!,
                  style: TextStyle(
                    fontSize: isMobileScreen ? 11 : 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : (isDark
                            ? AppColors.textDarkSecondary
                            : AppColors.textLightSecondary),
                  ),
                ),
                selectedColor: AppColors.primary,
                backgroundColor:
                    isDark ? AppColors.bgDarkCard : AppColors.bgLightCard,
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
                  setState(() {
                    _currentPage = 0;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: isMobileScreen ? 14 : 24),

          // Responsive Display: Interactive Swipeable Carousel on Mobile, Grid on Desktop
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 680;
              final isTablet =
                  constraints.maxWidth >= 680 && constraints.maxWidth < 1050;

              if (isMobile) {
                if (projects.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  children: [
                    SizedBox(
                      height: 410,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: projects.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: ProjectCard(
                              project: projects[index],
                              isArabic: widget.isArabic,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Swipe Indicator & Next/Prev Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Prev Button
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded, size: 14),
                          onPressed: _currentPage > 0
                              ? () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutCubic,
                                  );
                                }
                              : null,
                          style: IconButton.styleFrom(
                            backgroundColor: isDark
                                ? AppColors.bgDarkSecondary
                                : AppColors.bgLightSecondary,
                            padding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Dots Indicator
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            projects.length,
                            (dotIndex) => AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: _currentPage == dotIndex ? 20 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? AppColors.primary
                                    : (isDark
                                        ? Colors.white24
                                        : Colors.black26),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Next Button
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                          onPressed: _currentPage < projects.length - 1
                              ? () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutCubic,
                                  );
                                }
                              : null,
                          style: IconButton.styleFrom(
                            backgroundColor: isDark
                                ? AppColors.bgDarkSecondary
                                : AppColors.bgLightSecondary,
                            padding: const EdgeInsets.all(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }

              // Desktop & Tablet: Multi-column Grid
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 3,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isTablet ? 0.72 : 0.68,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: projects[index],
                    isArabic: widget.isArabic,
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
