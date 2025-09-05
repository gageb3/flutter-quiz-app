import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
// Main quiz app widget
// Stateful because it switches between screens and stores selected answers
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // Store all user-selected answers
  var activeScreen = 'start-screen';       // Track which screen to show

  // Called when user selects an answer
  void chooseAnswer(String answer){
    selectedAnswers.add(answer); // Add answer to list

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  // Called to switch from start screen to questions screen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; // Change screen
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen); // Default screen

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // Gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 100, 17, 241),
                Color.fromARGB(255, 18, 3, 46),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // Show either start or questions screen
        ),
      ),
    );
  }
}
