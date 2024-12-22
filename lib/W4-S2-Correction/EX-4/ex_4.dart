import 'package:flutter/material.dart';

Color themeColor = const Color(0xffA9D453);

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: themeColor,
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ScoreWidget(title: "My score in Flutter"),
              ScoreWidget(title: "My score in Dart"),
              ScoreWidget(title: "My score in React"),
            ],
          ),
        ),
      ),
    ));

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  int score = 5; // 0 to 10

  final double progressBarWith = 400;

  double get scoreRatio => score / 10.0; // score for 0 to 1

  Color get scoreColor {
    switch (score) {
      case 1:
        return Colors.green[100] as Color;
      case 2:
        return Colors.green[200] as Color;
      case 3:
        return Colors.green[300] as Color;
      case 4:
        return Colors.green[400] as Color;
      case 5:
        return Colors.green[500] as Color;
      case 6:
        return Colors.green[600] as Color;
      case 8:
        return Colors.green[700] as Color;
      case 9:
        return Colors.green[800] as Color;
      default:
        return Colors.green[900] as Color;
    }
  }

  void onMinus() {
    setState(() {
      if (score > 1) {
        score--;
      }
    });
  }

  void onAdd() {
    setState(() {
      if (score < 10) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                color: Colors.grey, fontSize: 35, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                tooltip: 'Minus one',
                onPressed: onMinus,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add one',
                onPressed: onAdd,
              ),
            ],
          ),
          ProgressBar(
              progressBarWith: progressBarWith,
              scoreRatio: scoreRatio,
              scoreColor: scoreColor)
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progressBarWith,
    required this.scoreRatio,
    required this.scoreColor,
  });

  final double progressBarWith;
  final double scoreRatio;
  final Color scoreColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            height: 60,
            width: progressBarWith,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            height: 60,
            width: progressBarWith * scoreRatio,
            decoration: BoxDecoration(
                color: scoreColor, borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}
