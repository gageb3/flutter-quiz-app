import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
class ResultsScreen extends StatelessWidget {

  const ResultsScreen({
    super.key,
    required this.chosenAnswers
    });

    final List<String> chosenAnswers;

    List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary = [];

      for (var i = 0; i < chosenAnswers.length; i++) {
        // loop body
        summary.add({
          'question_index': i,
          'question' : questions[i].text,
          'correct_answer' : questions[i].answers[0],
          'user_answer' : chosenAnswers[i]

        }
      );
    }

      return summary;
    }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered * out of * questions correctly."),
            const SizedBox(height:40),
            const Text("List of answers and questions"),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Text('Restart Quiz!'),
            )
          ],

        ),
      ),
    );
  }
}