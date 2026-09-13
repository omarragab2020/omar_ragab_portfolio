import 'package:flutter/material.dart';

class AppColors {
  // Primary Neon Brand Palette
  static const Color primary = Color(0xFF6366F1); // Indigo Vibrant
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4338CA);
  
  static const Color secondary = Color(0xFF06B6D4); // Cyan Neon
  static const Color accent = Color(0xFF10B981); // Emerald
  static const Color pinkNeon = Color(0xFFEC4899);
  static const Color purpleNeon = Color(0xFF8B5CF6);
  static const Color amberNeon = Color(0xFFF59E0B);

  // Dark Theme Backgrounds (Deep Cyber Theme)
  static const Color bgDark = Color(0xFF0B0F19);
  static const Color bgDarkSecondary = Color(0xFF111827);
  static const Color bgDarkCard = Color(0xFF1F2937);
  static const Color bgDarkCardHover = Color(0xFF283548);
  
  // Light Theme Backgrounds
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color bgLightSecondary = Color(0xFFEDF2F7);
  static const Color bgLightCard = Color(0xFFFFFFFF);
  static const Color bgLightCardHover = Color(0xFFF1F5F9);

  // Text Colors Dark
  static const Color textDarkPrimary = Color(0xFFF9FAFB);
  static const Color textDarkSecondary = Color(0xFF9CA3AF);
  static const Color textDarkMuted = Color(0xFF6B7280);

  // Text Colors Light
  static const Color textLightPrimary = Color(0xFF0F172A);
  static const Color textLightSecondary = Color(0xFF475569);
  static const Color textLightMuted = Color(0xFF94A3B8);

  // Borders & Glows
  static const Color borderDark = Color(0xFF374151);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color glowCyan = Color(0x6606B6D4);
  static const Color glowIndigo = Color(0x666366F1);
  static const Color glowPurple = Color(0x668B5CF6);

  // Gradients
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF06B6D4), Color(0xFF10B981)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanPurpleGradient = LinearGradient(
    colors: [Color(0xFF06B6D4), Color(0xFF8B5CF6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xCC1E293B), Color(0x990F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
