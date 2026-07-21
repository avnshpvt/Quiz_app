import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';

class NavButtons extends StatelessWidget {
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final bool hasPrev;
  final bool hasNext;

  const NavButtons({
    super.key,
    required this.onPrev,
    required this.onNext,
    required this.hasPrev,
    required this.hasNext,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallMobile = screenWidth < 400;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: _PillButton(
              label: 'Prev',
              onTap: hasPrev ? onPrev : null,
              isEnabled: hasPrev,
              isSmall: isSmallMobile,
            ),
          ),
          SizedBox(width: isSmallMobile ? 12 : 24),
          Flexible(
            child: _PillButton(
              label: 'Next',
              onTap: hasNext ? onNext : null,
              isEnabled: hasNext,
              isSmall: isSmallMobile,
            ),
          ),
        ],
      ),
    );
  }
}

class _PillButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isEnabled;
  final bool isSmall;

  const _PillButton({
    required this.label,
    required this.onTap,
    required this.isEnabled,
    this.isSmall = false,
  });

  @override
  State<_PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<_PillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSmall ? 24 : 36,
            vertical: widget.isSmall ? 10 : 12,
          ),
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? (_isHovered ? const Color(0xFFF8FAFC) : Colors.white)
                : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: widget.isEnabled ? AppColors.buttonShadow : [],
          ),
          child: Text(
            widget.label,
            style: AppStyles.buttonText.copyWith(
              fontSize: widget.isSmall ? 13 : 14,
              color: widget.isEnabled
                  ? AppColors.textPrimary
                  : AppColors.badgeUnansweredText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
