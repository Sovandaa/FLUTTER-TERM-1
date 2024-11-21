import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/W7-S2/quiz-logo.png", height: 300),
                // SizedBox(
                //   height: 10,
                // ),
                Text("Crazy Quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    )),
                AppButton("Start Quiz", onTap:(){} , icon: Icons.arrow_forward),
              ],
            ),
          ),
        ));
  }
}
