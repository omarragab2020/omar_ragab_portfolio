import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:omar_ragab_portfolio/main.dart';
import 'package:omar_ragab_portfolio/presentation/controllers/portfolio_controller.dart';
import 'package:omar_ragab_portfolio/core/constants/portfolio_data.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => PortfolioController(),
        child: const OmarPortfolioApp(),
      ),
    );
    expect(PortfolioData.projects.isNotEmpty, isTrue);
    expect(PortfolioData.skillCategories.isNotEmpty, isTrue);
    expect(PortfolioData.experiences.isNotEmpty, isTrue);
  });
}
