import 'package:flutter/material.dart';
import '../core/services/quiz_storage_service.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  final QuizStorageService _storageService;
  final List<QuestionModel> _questions = sampleQuestions;

  int _currentIndex = 0;
  Map<int, int> _userAnswers = {};
  bool _isLoading = true;

  QuizProvider(this._storageService) {
    _loadStateFromStorage();
  }

  // Getters
  List<QuestionModel> get questions => _questions;
  int get totalQuestions => _questions.length;
  int get currentIndex => _currentIndex;
  QuestionModel get currentQuestion => _questions[_currentIndex];
  Map<int, int> get userAnswers => _userAnswers;
  bool get isLoading => _isLoading;

  int get answeredCount => _userAnswers.length;

  /// Load state from SharedPreferences
  void _loadStateFromStorage() {
    _userAnswers = _storageService.loadAnswers();
    int savedIndex = _storageService.loadCurrentIndex();
    if (savedIndex >= 0 && savedIndex < _questions.length) {
      _currentIndex = savedIndex;
    } else {
      _currentIndex = 0;
    }
    _isLoading = false;
    notifyListeners();
  }

  /// Select answer for a given question index.
  /// Rule: Once an answer is selected, it cannot be changed.
  void selectAnswer(int questionIndex, int optionIndex) {
    if (_userAnswers.containsKey(questionIndex)) {
      // Answer already selected and locked!
      return;
    }

    _userAnswers[questionIndex] = optionIndex;
    _storageService.saveAnswers(_userAnswers);
    notifyListeners();
  }

  /// Check if question at index is answered
  bool isAnswered(int questionIndex) {
    return _userAnswers.containsKey(questionIndex);
  }

  /// Get selected option index for a question, returns null if unanswered
  int? getSelectedOption(int questionIndex) {
    return _userAnswers[questionIndex];
  }

  /// Check if user's selected answer was correct
  bool? isAnswerCorrect(int questionIndex) {
    final selected = _userAnswers[questionIndex];
    if (selected == null) return null;
    return selected == _questions[questionIndex].correctAnswerIndex;
  }

  /// Navigate to next question
  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _storageService.saveCurrentIndex(_currentIndex);
      notifyListeners();
    }
  }

  /// Navigate to previous question
  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _storageService.saveCurrentIndex(_currentIndex);
      notifyListeners();
    }
  }

  /// Navigate directly to a question by index
  void goToQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _currentIndex = index;
      _storageService.saveCurrentIndex(_currentIndex);
      notifyListeners();
    }
  }

  /// Reset all progress and clear SharedPreferences
  Future<void> resetQuiz() async {
    _userAnswers.clear();
    _currentIndex = 0;
    await _storageService.clearAll();
    notifyListeners();
  }
}
