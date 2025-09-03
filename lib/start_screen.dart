import 'package:flutter/material.dart'; // Import Flutter's material design widgets

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key}); 
  // Constructor with a const modifier for performance optimization
  // super.key passes the key to the parent StatelessWidget
final void Function() startQuiz;

  @override
  Widget build(context) {
    // The build method describes the UI of this widget
    return Center(
      // Center widget centers its child both vertically and horizontally
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Column arranges its children vertically
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(155, 255, 255, 255), 
          ),
          // Opacity(
          //   opacity: 0.4,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png', // Load an image from the assets folder
          //     width: 300,                     // Set the width of the image
          //   ),
          // ),
          const SizedBox(height: 150),     // Add vertical spacing of 150 pixels
          const Text(
            'Learn flutter the fun way!',   // Display text
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), // White text color
              fontSize: 24,                              // Font size 24
            ),
          ),
          const SizedBox(height: 30),      // Add 30 pixels of vertical spacing
          OutlinedButton.icon(
            onPressed: startQuiz,              // Callback when button is pressed (empty for now)
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // Button text color
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'), // Button label
          ),
        ],
      ),
    );
  }
}
