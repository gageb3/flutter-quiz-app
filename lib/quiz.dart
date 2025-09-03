// return material app, stateful
import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart'; // Import your custom StartScreen widget
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  // createState creates an instance of _QuizState, 
  // which holds the changeable state of this widget
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // This variable tracks which screen should currently be shown.
  // It starts with the StartScreen widget.
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   // will execute once after the object has been created.
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  // This method is called when you want to switch from StartScreen -> QuestionsScreen
  void switchScreen() {
    setState(() {
      // calling setState changes activeScreen from StartScreen to QuestionsScreen
      // setState tells Flutter: "Hey, something changed!"
      // Flutter will re-render the widget tree and display the new screen
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }
    

    return MaterialApp(
      // MaterialApp is the root of the app; provides themes, routing, etc.
      home: Scaffold(
        // Scaffold provides the basic app layout structure
        body: Container(
          // Container allows layout, padding, margins, and styling
          decoration: BoxDecoration(
            // BoxDecoration lets you style the container (e.g., gradient background)
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 100, 17, 241), // Gradient start color
                Color.fromARGB(255, 18, 3, 46),    // Gradient end color
              ],
              begin: Alignment.topLeft,   // Gradient starts from top-left
              end: Alignment.bottomRight, // Gradient ends at bottom-right
            ),
          ),
          child: screenWidget, 
          // The widget shown here depends on activeScreen.
          // Initially: StartScreen()
          // After switchScreen() is called: QuestionsScreen()
          //
          // 🔑 This is conditional rendering in Flutter:
          // Instead of "if/else", we swap out the widget stored in activeScreen.
        ),
      ),
    );
  }
}
