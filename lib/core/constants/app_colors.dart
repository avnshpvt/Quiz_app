import 'package:flutter/material.dart';

class AppColors {
  // Page & Background
  static const Color pageBackground = Color(0xFF3577FF);
  static const Color containerBackground = Colors.white;

  // Header Banner
  static const Color headerText = Color(0xFFFF5B5C);

  // Question Card
  static const Color questionBorder = Color(0xFF8BB5FF);
  static const Color questionBackground = Color(0xFFFAFCFF);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);

  // Answer Options
  static const Color optionDefaultBg = Colors.white;
  static const Color optionDefaultBorder = Color(0xFFF1F5F9);
  
  static const Color optionCorrectBg = Color(0xFFECFDF5);
  static const Color optionCorrectBorder = Color(0xFF10B981);
  static const Color optionCorrectText = Color(0xFF047857);

  static const Color optionIncorrectBg = Color(0xFFFEF2F2);
  static const Color optionIncorrectBorder = Color(0xFFEF4444);
  static const Color optionIncorrectText = Color(0xFFB91C1C);

  // Question Selector Badges
  static const Color badgeActiveBg = Color(0xFFFF8A8A);      // Pink/Coral (Current)
  static const Color badgeActiveText = Colors.white;

  static const Color badgeAnsweredBg = Color(0xFF93C5FD);    // Periwinkle/Blue (Answered)
  static const Color badgeAnsweredText = Colors.white;

  static const Color badgeUnansweredBg = Color(0xFFCBD5E1);  // Soft Gray (Unanswered)
  static const Color badgeUnansweredText = Color(0xFF475569);

  // Shadow
  static final List<BoxShadow> cardShadow = [
    const BoxShadow(
      color: Color(0x0F000000), // ~6% opacity black
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static final List<BoxShadow> buttonShadow = [
    const BoxShadow(
      color: Color(0x14000000), // ~8% opacity black
      blurRadius: 10,
      offset: Offset(0, 3),
    ),
  ];
}
