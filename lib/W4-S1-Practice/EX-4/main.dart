// The weather forecast (bonus)

import 'package:flutter/material.dart';

enum Weather {Sunny, Rainy, Cloudy, Snowy}
enum Temperature {min, max}
enum DayOfWeek {Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            child: SizedBox(
              height: 120,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Column(
                    children: [
                      Text("Sun",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),  
                  )
                ],
              ),
            ),
        ),
      ),
    ),
  ));
}
