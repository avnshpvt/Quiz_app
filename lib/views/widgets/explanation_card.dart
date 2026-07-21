import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';

class ExplanationCard extends StatelessWidget {
  final String explanation;
  final bool isAnswered;

  const ExplanationCard({
    super.key,
    required this.explanation,
    required this.isAnswered,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 14 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
        border: Border.all(
          color: const Color(0xFFF1F5F9),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explanation',
            style: AppStyles.cardHeaderTitle.copyWith(
              fontSize: isMobile ? 15 : 16,
            ),
          ),
          const SizedBox(height: 10),
          isAnswered
              ? Text(
                  explanation,
                  style: AppStyles.questionBody.copyWith(
                    fontSize: isMobile ? 13 : 14,
                  ),
                )
              : Row(
                  children: [
                    const Icon(
                      Icons.lock_clock,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Select an answer to unlock the explanation.',
                        style: AppStyles.questionBody.copyWith(
                          fontSize: isMobile ? 12 : 13,
                          color: AppColors.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
