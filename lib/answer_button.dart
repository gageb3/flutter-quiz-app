import 'package:flutter/material.dart';

// Custom button widget for displaying quiz answers
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText, 
    required this.onTap, 
  });

  final String answerText;      // Text to display on the button
  final void Function() onTap;  // Callback when the button is pressed

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, // When pressed, call the provided callback
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10, 
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 85, 18, 173),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText, 
        textAlign: TextAlign.center, // Center the text inside the button
      ),
    );
  }
}
