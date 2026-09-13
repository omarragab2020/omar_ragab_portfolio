import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../controllers/portfolio_controller.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/particles_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isAutoScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isAutoScrolling || !_scrollController.hasClients) return;

    final keys = [
      _heroKey,
      _aboutKey,
      _experienceKey,
      _projectsKey,
      _skillsKey,
      _contactKey,
    ];

    int bestIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < keys.length; i++) {
      final ctx = keys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          final position = box.localToGlobal(Offset.zero).dy;
          // Offset relative to navigation bar (72px + 60px viewport threshold)
          final distance = (position - 120.0).abs();
          if (position <= 350.0 && distance < minDistance) {
            minDistance = distance;
            bestIndex = i;
          }
        }
      }
    }

    final controller = context.read<PortfolioController>();
    if (controller.activeNavIndex != bestIndex) {
      controller.setActiveNavIndex(bestIndex);
    }
  }

  void _scrollToKey(GlobalKey key, int index) async {
    final ctx = key.currentContext;
    if (ctx != null) {
      _isAutoScrolling = true;
      context.read<PortfolioController>().setActiveNavIndex(index);
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      await Future.delayed(const Duration(milliseconds: 150));
      _isAutoScrolling = false;
    }
  }

  void _onNavSectionSelected(int index) {
    switch (index) {
      case 0:
        _scrollToKey(_heroKey, 0);
        break;
      case 1:
        _scrollToKey(_aboutKey, 1);
        break;
      case 2:
        _scrollToKey(_experienceKey, 2);
        break;
      case 3:
        _scrollToKey(_projectsKey, 3);
        break;
      case 4:
        _scrollToKey(_skillsKey, 4);
        break;
      case 5:
        _scrollToKey(_contactKey, 5);
        break;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final isAr = controller.isArabic;
    final isDark = controller.isDarkMode;

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            // Background with ambient glow & floating particles
            Positioned.fill(
              child: ParticlesBackground(
                isDark: isDark,
                child: const SizedBox.expand(),
              ),
            ),

            // Scrollable Content
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 72), // NavBar spacing

                    // Centered Content Max-Width Wrapper
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Hero Section (0)
                              Container(
                                key: _heroKey,
                                child: HeroSection(
                                  isArabic: isAr,
                                  onViewProjects: () => _scrollToKey(_projectsKey, 3),
                                  onContactMe: () => _scrollToKey(_contactKey, 5),
                                ),
                              ),

                              // About Section (1)
                              Container(
                                key: _aboutKey,
                                child: AboutSection(isArabic: isAr),
                              ),

                              // Experience & Terminal Section (2) 💼
                              Container(
                                key: _experienceKey,
                                child: ExperienceSection(isArabic: isAr),
                              ),

                              // Projects Section (3) 🚀
                              Container(
                                key: _projectsKey,
                                child: ProjectsSection(isArabic: isAr),
                              ),

                              // Skills Section (4) ⚡
                              Container(
                                key: _skillsKey,
                                child: SkillsSection(isArabic: isAr),
                              ),

                              // Contact Section (5) ✉️
                              Container(
                                key: _contactKey,
                                child: ContactSection(isArabic: isAr),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Footer
                    FooterSection(
                      isArabic: isAr,
                      onScrollToTop: () => _scrollToKey(_heroKey, 0),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Frosted Sticky Navigation Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavBar(
                onSectionSelected: _onNavSectionSelected,
              ),
            ),

            // Floating Mobile Bottom Navigation Dock (Interactive App-Like Feel)
            if (MediaQuery.of(context).size.width < 768)
              Positioned(
                bottom: 14,
                left: 16,
                right: 16,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF0D1117).withValues(alpha: 0.92)
                          : Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.28),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildMobileNavIcon(0, Icons.home_rounded,
                            isAr ? "الرئيسية" : "Home", controller.activeNavIndex, isDark),
                        _buildMobileNavIcon(1, Icons.person_rounded,
                            isAr ? "عني" : "About", controller.activeNavIndex, isDark),
                        _buildMobileNavIcon(2, Icons.work_rounded,
                            isAr ? "الخبرات" : "Career", controller.activeNavIndex, isDark),
                        _buildMobileNavIcon(3, Icons.layers_rounded,
                            isAr ? "المشاريع" : "Projects", controller.activeNavIndex, isDark),
                        _buildMobileNavIcon(4, Icons.code_rounded,
                            isAr ? "المهارات" : "Skills", controller.activeNavIndex, isDark),
                        _buildMobileNavIcon(5, Icons.mail_rounded,
                            isAr ? "تواصل" : "Contact", controller.activeNavIndex, isDark),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNavIcon(int index, IconData icon, String tooltip,
      int activeIndex, bool isDark) {
    final isActive = activeIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: InkWell(
        onTap: () => _onNavSectionSelected(index),
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive ? AppColors.primary : Colors.transparent,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 19,
            color: isActive
                ? AppColors.primaryLight
                : (isDark ? Colors.white54 : Colors.black54),
          ),
        ),
      ),
    );
  }
}
