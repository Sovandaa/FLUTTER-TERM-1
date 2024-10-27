import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100]
              ),
              child: const Center(
                child: Text("OOP", 
                  style: 
                    TextStyle(fontSize: 24, 
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[300]
              ),
              child: const Center(
                child: Text("DART", 
                  style: 
                    TextStyle(fontSize: 24, 
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                    Colors.blue[300]!, 
                    Colors.blue[600]!
                  ])
                  // use ! to check color will not be null (color exist)
              ),
              child: const Center(
                child: Text("FLUTTER", 
                  style: 
                    TextStyle(fontSize: 24, 
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            )
          ],
        ),
    ),
  ));
}
