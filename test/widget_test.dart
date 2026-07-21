import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mechine_test/main.dart';

void main() {
  testWidgets('Quiz App Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());
  });
}
