import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/quiz_storage_service.dart';
import 'providers/quiz_provider.dart';
import 'views/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences storage service
  final storageService = await QuizStorageService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(storageService),
        ),
      ],
      child: const QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3577FF),
        ),
      ),
      home: const QuizScreen(),
    );
  }
}
