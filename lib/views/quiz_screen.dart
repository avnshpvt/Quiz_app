import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';
import '../providers/quiz_provider.dart';
import 'widgets/header_banner.dart';
import 'widgets/question_card.dart';
import 'widgets/option_card.dart';
import 'widgets/nav_buttons.dart';
import 'widgets/explanation_card.dart';
import 'widgets/question_selector.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Consumer<QuizProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }

            final currentQ = provider.currentQuestion;
            final currentIndex = provider.currentIndex;
            final isCurrentAnswered = provider.isAnswered(currentIndex);
            final selectedOption = provider.getSelectedOption(currentIndex);

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24,
                vertical: isMobile ? 16 : 32,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1080),
                  child: Column(
                    children: [
                      // Top Banner Header
                      const HeaderBanner(),

                      // Main White Card Container
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isMobile ? 16 : 28),
                        decoration: BoxDecoration(
                          color: AppColors.containerBackground,
                          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1F000000),
                              blurRadius: 24,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Quiz Title Header
                            Text(
                              'Quiz Title',
                              style: AppStyles.cardHeaderTitle.copyWith(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: isMobile ? 16 : 24),

                            // Responsive Row/Column
                            LayoutBuilder(
                              builder: (context, constraints) {
                                bool isWideScreen = constraints.maxWidth > 760;

                                if (isWideScreen) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Left Question Content Column
                                      Expanded(
                                        flex: 65,
                                        child: _buildQuestionContent(
                                          context,
                                          provider,
                                          currentQ,
                                          currentIndex,
                                          isCurrentAnswered,
                                          selectedOption,
                                          isMobile,
                                        ),
                                      ),

                                      // Vertical Divider Line
                                      Container(
                                        width: 1,
                                        margin: const EdgeInsets.symmetric(horizontal: 16),
                                        color: const Color(0xFFF1F5F9),
                                      ),

                                      // Right Question Selector Sidebar Column
                                      Expanded(
                                        flex: 35,
                                        child: QuestionSelector(
                                          totalQuestions: provider.totalQuestions,
                                          currentIndex: provider.currentIndex,
                                          userAnswers: provider.userAnswers,
                                          onQuestionSelect: (index) {
                                            provider.goToQuestion(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  // Mobile / Tablet Stacked layout
                                  return Column(
                                    children: [
                                      _buildQuestionContent(
                                        context,
                                        provider,
                                        currentQ,
                                        currentIndex,
                                        isCurrentAnswered,
                                        selectedOption,
                                        isMobile,
                                      ),
                                      const Divider(height: 32, thickness: 1, color: Color(0xFFF1F5F9)),
                                      QuestionSelector(
                                        totalQuestions: provider.totalQuestions,
                                        currentIndex: provider.currentIndex,
                                        userAnswers: provider.userAnswers,
                                        onQuestionSelect: (index) {
                                          provider.goToQuestion(index);
                                        },
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionContent(
    BuildContext context,
    QuizProvider provider,
    dynamic currentQ,
    int currentIndex,
    bool isCurrentAnswered,
    int? selectedOption,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question Outline Card
        QuestionCard(
          question: currentQ,
          questionIndex: currentIndex,
        ),
        SizedBox(height: isMobile ? 12 : 20),

        // Answer Options List
        ...List.generate(
          currentQ.options.length,
          (optIdx) => OptionCard(
            optionText: currentQ.options[optIdx],
            optionIndex: optIdx,
            correctAnswerIndex: currentQ.correctAnswerIndex,
            selectedOptionIndex: selectedOption,
            isAnswered: isCurrentAnswered,
            onTap: () {
              provider.selectAnswer(currentIndex, optIdx);
            },
          ),
        ),

        // Prev / Next Navigation Buttons
        NavButtons(
          onPrev: () => provider.previousQuestion(),
          onNext: () => provider.nextQuestion(),
          hasPrev: currentIndex > 0,
          hasNext: currentIndex < provider.totalQuestions - 1,
        ),
        const SizedBox(height: 4),

        // Explanation Card
        ExplanationCard(
          explanation: currentQ.explanation,
          isAnswered: isCurrentAnswered,
        ),
      ],
    );
  }
}
