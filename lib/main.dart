import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'presentation/controllers/portfolio_controller.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => PortfolioController(),
      child: const OmarPortfolioApp(),
    ),
  );
}

class OmarPortfolioApp extends StatelessWidget {
  const OmarPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();

    return MaterialApp(
      title: controller.isArabic
          ? "عمر رجب | مطور تطبيقات فلاتر"
          : "Omar Ragab | Flutter Developer Portfolio",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: controller.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: controller.isArabic ? const Locale('ar') : const Locale('en'),
      home: const HomeScreen(),
    );
  }
}
