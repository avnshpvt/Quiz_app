import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuizStorageService {
  static const String _keyUserAnswers = 'quiz_user_answers';
  static const String _keyCurrentIndex = 'quiz_current_index';

  final SharedPreferences _prefs;

  QuizStorageService(this._prefs);

  static Future<QuizStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return QuizStorageService(prefs);
  }

  /// Save answers map: { questionIndex: selectedOptionIndex }
  Future<bool> saveAnswers(Map<int, int> answers) async {
    final Map<String, int> stringKeyMap = answers.map((key, value) => MapEntry(key.toString(), value));
    final jsonString = jsonEncode(stringKeyMap);
    return await _prefs.setString(_keyUserAnswers, jsonString);
  }

  /// Load answers map
  Map<int, int> loadAnswers() {
    final jsonString = _prefs.getString(_keyUserAnswers);
    if (jsonString == null || jsonString.isEmpty) {
      return {};
    }
    try {
      final Map<String, dynamic> decoded = jsonDecode(jsonString);
      final Map<int, int> result = {};
      decoded.forEach((key, value) {
        final intKey = int.tryParse(key);
        if (intKey != null && value is int) {
          result[intKey] = value;
        }
      });
      return result;
    } catch (_) {
      return {};
    }
  }

  /// Save active question index
  Future<bool> saveCurrentIndex(int index) async {
    return await _prefs.setInt(_keyCurrentIndex, index);
  }

  /// Load active question index
  int loadCurrentIndex() {
    return _prefs.getInt(_keyCurrentIndex) ?? 0;
  }

  /// Clear all stored quiz data
  Future<void> clearAll() async {
    await _prefs.remove(_keyUserAnswers);
    await _prefs.remove(_keyCurrentIndex);
  }
}
