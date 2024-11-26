import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  
  final VoidCallback onFinish;

  const QuestionScreen({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return const Text("Question Screen");
  }
}
