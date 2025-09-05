// This file defines the QuizQuestion model, which represents a single quiz question.

class QuizQuestion {
  // Constructor: takes question text and a list of possible answers
  const QuizQuestion(this.text, this.answers);

  final String text;          // The text of the question
  final List<String> answers; // The possible answers

  // Method to return a shuffled list of answers
  // This ensures that answers appear in a different order each time
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // Make a copy of the original answers
    shuffledList.shuffle();                // Shuffle the copy
    return shuffledList;                   // Return the shuffled list
  }
}
