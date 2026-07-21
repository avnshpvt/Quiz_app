import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../models/question_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final int questionIndex;

  const QuestionCard({
    super.key,
    required this.question,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 14 : 20),
      decoration: BoxDecoration(
        color: AppColors.questionBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.questionBorder,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${questionIndex + 1}',
            style: AppStyles.questionTitle.copyWith(
              fontSize: isMobile ? 14 : 15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.questionText,
            style: AppStyles.questionBody.copyWith(
              fontSize: isMobile ? 13 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
