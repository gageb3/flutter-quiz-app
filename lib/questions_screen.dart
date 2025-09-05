import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

// Screen that displays quiz questions and answers
// Stateful because it tracks the current question index
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer; // Callback when an answer is selected

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0; // Track which question is currently displayed

  // Called when user selects an answer
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // Pass answer to parent
    setState(() {
      currentQuestionIndex++; // Move to next question
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; // Current question

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display question text
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 124, 115, 138),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Space between question and answers
            // Display all answers as buttons
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer); // Handle answer selection
                }, 
              );
            })
          ],
        ),
      ),
    );
  }
}
