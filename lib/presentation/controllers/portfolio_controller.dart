import 'package:flutter/material.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/utils/url_helper.dart';

class TerminalEntry {
  final String command;
  final String response;
  final bool isError;
  final DateTime timestamp;

  TerminalEntry({
    required this.command,
    required this.response,
    this.isError = false,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class PortfolioController extends ChangeNotifier {
  bool _isDarkMode = true;
  bool _isArabic = false; // Default language: English
  String _selectedCategory = "All";
  int _activeNavIndex = 0;
  
  // Terminal
  final List<TerminalEntry> _terminalHistory = [];
  bool _isMatrixMode = false;

  PortfolioController() {
    _initTerminal();
  }

  // Getters
  bool get isDarkMode => _isDarkMode;
  bool get isArabic => _isArabic;
  String get selectedCategory => _selectedCategory;
  int get activeNavIndex => _activeNavIndex;
  List<TerminalEntry> get terminalHistory => _terminalHistory;
  bool get isMatrixMode => _isMatrixMode;

  // Filtered Projects (prioritizes Live Store apps at the top)
  List<ProjectModel> get filteredProjects {
    List<ProjectModel> list;
    if (_selectedCategory == "All") {
      list = List.from(PortfolioData.projects);
    } else if (_selectedCategory == "Stores") {
      list = PortfolioData.projects
          .where((p) => p.playStoreUrl != null || p.appStoreUrl != null)
          .toList();
    } else {
      list = PortfolioData.projects
          .where((p) => p.category.toLowerCase() == _selectedCategory.toLowerCase())
          .toList();
    }

    // Sort to guarantee store-published projects always appear first
    list.sort((a, b) {
      final aStore = (a.playStoreUrl != null ? 1 : 0) + (a.appStoreUrl != null ? 1 : 0);
      final bStore = (b.playStoreUrl != null ? 1 : 0) + (b.appStoreUrl != null ? 1 : 0);
      if (aStore != bStore) {
        return bStore.compareTo(aStore);
      }
      return 0;
    });

    return list;
  }

  // Setters / Actions
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleLanguage() {
    _isArabic = !_isArabic;
    notifyListeners();
  }

  void setLanguage(bool isAr) {
    _isArabic = isAr;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setActiveNavIndex(int index) {
    _activeNavIndex = index;
    notifyListeners();
  }

  void _initTerminal() {
    _terminalHistory.add(
      TerminalEntry(
        command: "init",
        response: "⚡ Welcome to Omar Ragab Developer Terminal v2.0.0\nType 'help' to view available commands.",
      ),
    );
  }

  void executeTerminalCommand(String input) {
    final cmd = input.trim().toLowerCase();
    if (cmd.isEmpty) return;

    if (cmd == "clear") {
      _terminalHistory.clear();
      notifyListeners();
      return;
    }

    if (cmd == "help") {
      final buffer = StringBuffer("Available commands:\n");
      PortfolioData.terminalHelpCommands.forEach((key, val) {
        buffer.writeln("    $key : $val");
      });
      _terminalHistory.add(TerminalEntry(command: input, response: buffer.toString().trim()));
    } else if (cmd == "about") {
      final text = _isArabic ? PortfolioData.bioAr : PortfolioData.bioEn;
      _terminalHistory.add(TerminalEntry(command: input, response: "👨‍💻 Omar Ragab - Flutter Developer\n$text"));
    } else if (cmd == "skills") {
      final buffer = StringBuffer("🚀 Primary Tech Stack:\n");
      for (final cat in PortfolioData.skillCategories) {
        buffer.writeln("📂 ${cat.titleEn}:");
        for (final s in cat.skills) {
          buffer.writeln("   - ${s.name} (${(s.level * 100).toInt()}%)");
        }
      }
      _terminalHistory.add(TerminalEntry(command: input, response: buffer.toString().trim()));
    } else if (cmd == "projects") {
      final buffer = StringBuffer("📦 Featured Flutter Projects (Total ${PortfolioData.projects.length}):\n");
      for (final p in PortfolioData.projects) {
        buffer.writeln("   ${p.titleEn} [${p.category}] - ${p.subtitleEn}");
      }
      _terminalHistory.add(TerminalEntry(command: input, response: buffer.toString().trim()));
    } else if (cmd == "experience") {
      final buffer = StringBuffer("💼 Career Journey:\n");
      for (final e in PortfolioData.experiences) {
        buffer.writeln("   ${e.periodEn} | ${e.roleEn} @ ${e.companyEn} (${e.locationEn})");
      }
      _terminalHistory.add(TerminalEntry(command: input, response: buffer.toString().trim()));
    } else if (cmd == "contact") {
      final resp = "📬 Get in Touch with Omar:\n   Email: ${PortfolioData.email}\n   Phone/WhatsApp: ${PortfolioData.displayPhone}\n   LinkedIn: ${PortfolioData.linkedinUrl}\n   GitHub: ${PortfolioData.githubUrl}";
      _terminalHistory.add(TerminalEntry(command: input, response: resp));
    } else if (cmd == "cv") {
      UrlHelper.openWhatsApp("Hi Omar, I would like to receive your latest CV PDF.");
      _terminalHistory.add(TerminalEntry(command: input, response: "📄 Initiating CV request via WhatsApp & opening contact channel..."));
    } else if (cmd == "sudo hire" || cmd == "hire") {
      UrlHelper.openWhatsApp("Hello Omar, We would love to hire you for our Flutter project!");
      _terminalHistory.add(TerminalEntry(command: input, response: "🤝 Access Granted! Opening WhatsApp direct chat with Omar..."));
    } else if (cmd == "matrix") {
      _isMatrixMode = !_isMatrixMode;
      _terminalHistory.add(TerminalEntry(command: input, response: _isMatrixMode ? "🟢 Matrix Mode ENABLED!" : "⚪ Matrix Mode DISABLED!"));
    } else {
      _terminalHistory.add(
        TerminalEntry(
          command: input,
          response: "Command not recognized: '$input'. Type 'help' for valid commands.",
          isError: true,
        ),
      );
    }
    notifyListeners();
  }
}
