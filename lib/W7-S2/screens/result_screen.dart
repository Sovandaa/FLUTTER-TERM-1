import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return const Text("Result Screen");
  }
}
