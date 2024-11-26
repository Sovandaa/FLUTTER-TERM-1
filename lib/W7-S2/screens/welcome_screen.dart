import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/W7-S2/quiz-logo.png", 
                height: 250,
                width: 250,
              ),
              SizedBox(height: 10),
              Text(quizTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              AppButton("Start Quiz",
                  onTap: onStart,
                  icon: Icons.arrow_forward),
            ],
          ),
        ));
  }
}
