import 'package:flutter/material.dart';

// Starting screen of the quiz app
// Stateless because it does not change after it's displayed
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key}); 
  // Constructor: receives a callback for when the quiz starts
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Take minimum vertical space
        children: [
          // Display logo image from assets
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(155, 255, 255, 255), 
          ),
          const SizedBox(height: 150), // Spacing between logo and text
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30), // Spacing between text and button
          OutlinedButton.icon(
            onPressed: startQuiz, // Call the startQuiz callback when pressed
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'),
          ),
        ],
      ),
    );
  }
}
