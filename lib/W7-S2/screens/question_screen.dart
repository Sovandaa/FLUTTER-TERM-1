import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final VoidCallback onTap;
  final Question question;

  const QuestionScreen({
    super.key,
    required this.onTap,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              ...question.possibleAnswers.map((answer) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SizedBox(
                    width: 400,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[300],
                      ),
                      child: Text(
                        answer,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
