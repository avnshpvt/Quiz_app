import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import 'help_dialog.dart';

class QuestionSelector extends StatelessWidget {
  final int totalQuestions;
  final int currentIndex;
  final Map<int, int> userAnswers;
  final Function(int) onQuestionSelect;

  const QuestionSelector({
    super.key,
    required this.totalQuestions,
    required this.currentIndex,
    required this.userAnswers,
    required this.onQuestionSelect,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 20,
        vertical: isMobile ? 16 : 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Question X/Y and Need Help ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ${currentIndex + 1}/$totalQuestions',
                style: AppStyles.sidebarHeader.copyWith(
                  fontSize: isMobile ? 13 : 14,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => const HelpDialog(),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Text(
                    'Need Help ?',
                    style: AppStyles.sidebarHeader.copyWith(
                      fontSize: isMobile ? 13 : 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Question Number Grid (Responsive columns based on container width)
          LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              int columns = 5;
              double spacing = 12.0;

              if (width < 250) {
                columns = 4;
                spacing = 8.0;
              } else if (width < 320) {
                columns = 5;
                spacing = 8.0;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: totalQuestions,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing + 4,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final bool isCurrent = index == currentIndex;
                  final bool isAnswered = userAnswers.containsKey(index);

                  Color badgeBg;
                  Color textColor;

                  if (isCurrent) {
                    badgeBg = AppColors.badgeActiveBg;
                    textColor = AppColors.badgeActiveText;
                  } else if (isAnswered) {
                    badgeBg = AppColors.badgeAnsweredBg;
                    textColor = AppColors.badgeAnsweredText;
                  } else {
                    badgeBg = AppColors.badgeUnansweredBg;
                    textColor = AppColors.badgeUnansweredText;
                  }

                  return _QuestionBadge(
                    number: index + 1,
                    backgroundColor: badgeBg,
                    textColor: textColor,
                    onTap: () => onQuestionSelect(index),
                    isMobile: isMobile,
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

class _QuestionBadge extends StatefulWidget {
  final int number;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final bool isMobile;

  const _QuestionBadge({
    required this.number,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.isMobile = false,
  });

  @override
  State<_QuestionBadge> createState() => _QuestionBadgeState();
}

class _QuestionBadgeState extends State<_QuestionBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _isHovered
                ? widget.backgroundColor.withAlpha(215)
                : widget.backgroundColor,
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.backgroundColor.withAlpha(100),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            '${widget.number}',
            style: AppStyles.badgeText.copyWith(
              fontSize: widget.isMobile ? 12 : 13,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
