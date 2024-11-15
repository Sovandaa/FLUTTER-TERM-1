import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SwitchNum(),
    ),
  ));
}

class SwitchNum extends StatefulWidget {
  const SwitchNum({super.key});

  @override
  State<SwitchNum> createState() => _SwitchNumState();
}

class _SwitchNumState extends State<SwitchNum> {
  List<int> nums = [1, 2, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Start"),
        ...nums.map((item) => Text(item.toString())).toList(),
        Text("End"),
      ],
    );
  }
}
