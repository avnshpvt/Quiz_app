import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../providers/quiz_provider.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(28),
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quiz Instructions & Legend',
                  style: AppStyles.cardHeaderTitle.copyWith(fontSize: 18),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildLegendItem(
              color: AppColors.badgeActiveBg,
              label: 'Current Question',
              description: 'Highlighted in pink circle',
            ),
            const SizedBox(height: 10),
            _buildLegendItem(
              color: AppColors.badgeAnsweredBg,
              label: 'Answered Question',
              description: 'Highlighted in periwinkle blue circle',
            ),
            const SizedBox(height: 10),
            _buildLegendItem(
              color: AppColors.badgeUnansweredBg,
              label: 'Unanswered Question',
              description: 'Shown in soft gray circle',
            ),
            const Divider(height: 32),
            Text(
              'Rules:',
              style: AppStyles.questionTitle,
            ),
            const SizedBox(height: 8),
            Text(
              '• Selecting an answer locks your choice permanently.\n'
              '• Correct answers are displayed in green.\n'
              '• Incorrect selections are displayed in red.\n'
              '• Explanations appear automatically once an answer is chosen.\n'
              '• All progress is stored locally via SharedPreferences.',
              style: AppStyles.questionBody,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: () async {
                    final provider = context.read<QuizProvider>();
                    await provider.resetQuiz();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Quiz progress has been reset.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent, size: 18),
                  label: const Text(
                    'Reset Progress',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pageBackground,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Got it'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String label,
    required String description,
  }) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppStyles.questionTitle.copyWith(fontSize: 13),
            ),
            Text(
              description,
              style: AppStyles.questionBody.copyWith(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
