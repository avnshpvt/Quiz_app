import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';

class OptionCard extends StatefulWidget {
  final String optionText;
  final int optionIndex;
  final int correctAnswerIndex;
  final int? selectedOptionIndex;
  final bool isAnswered;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.optionText,
    required this.optionIndex,
    required this.correctAnswerIndex,
    required this.selectedOptionIndex,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    final bool isCorrect = widget.optionIndex == widget.correctAnswerIndex;
    final bool isSelected = widget.optionIndex == widget.selectedOptionIndex;

    Color bgColor = AppColors.optionDefaultBg;
    Color borderColor = AppColors.optionDefaultBorder;
    TextStyle textStyle = AppStyles.optionText.copyWith(
      fontSize: isMobile ? 13 : 14,
    );
    Widget? statusIcon;

    if (widget.isAnswered) {
      if (isCorrect) {
        bgColor = AppColors.optionCorrectBg;
        borderColor = AppColors.optionCorrectBorder;
        textStyle = textStyle.copyWith(
          color: AppColors.optionCorrectText,
          fontWeight: FontWeight.w600,
        );
        statusIcon = Icon(
          Icons.check_circle_rounded,
          color: AppColors.optionCorrectBorder,
          size: isMobile ? 18 : 20,
        );
      } else if (isSelected && !isCorrect) {
        bgColor = AppColors.optionIncorrectBg;
        borderColor = AppColors.optionIncorrectBorder;
        textStyle = textStyle.copyWith(
          color: AppColors.optionIncorrectText,
          fontWeight: FontWeight.w600,
        );
        statusIcon = Icon(
          Icons.cancel_rounded,
          color: AppColors.optionIncorrectBorder,
          size: isMobile ? 18 : 20,
        );
      } else {
        bgColor = const Color(0xFFFAFAFA);
        borderColor = Colors.transparent;
        textStyle = textStyle.copyWith(
          color: AppColors.textSecondary,
        );
      }
    }

    return MouseRegion(
      cursor: widget.isAnswered
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) {
        if (!widget.isAnswered) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (!widget.isAnswered) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTap: widget.isAnswered ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 20,
            vertical: isMobile ? 12 : 16,
          ),
          decoration: BoxDecoration(
            color: _isHovered && !widget.isAnswered
                ? const Color(0xFFF8FAFC)
                : bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered && !widget.isAnswered
                  ? AppColors.questionBorder
                  : borderColor,
              width: (widget.isAnswered && (isCorrect || isSelected)) ? 1.5 : 1.0,
            ),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.optionText,
                  style: textStyle,
                ),
              ),
              if (statusIcon != null) ...[
                const SizedBox(width: 8),
                statusIcon,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
