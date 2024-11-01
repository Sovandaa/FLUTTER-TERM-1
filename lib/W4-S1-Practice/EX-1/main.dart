// // The hobbies

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("My Hobbies"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(
              title: "Travelling",
              icon: Icons.travel_explore,
              color: Colors.green
            ),
            HobbyCard(
              title: "Skating",
              icon: Icons.skateboarding,
              color: Colors.blueGrey
            ),           
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {
  // const HobbyCard({
  //   super.key,
  // });
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    required this.title, 
    required this.icon, 
    this.color = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 20.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
