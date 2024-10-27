import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CustomCard(text: "OOP", color: Colors.blue[100]),
          CustomCard(text: "DART", color: Colors.blue[300]),
          CustomCard(text: "FLUTTER", color: Colors.blue[600])
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  // const CustomCard({
  //   super.key,
  // });
  final String text;
  final Color? color;

  CustomCard({required this.text, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          color: color
        ),
      child: Center(
        child: Text(text,
          style: TextStyle(
              fontSize: 24, 
              color: Colors.white, 
              decoration: TextDecoration.none
            ),
        ),
      ),
    );
  }
}
