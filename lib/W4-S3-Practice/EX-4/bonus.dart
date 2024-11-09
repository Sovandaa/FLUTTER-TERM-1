// Bonus - Score Bar
// Didn't done yet just have ui 

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "My score in Flutter",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {}, 
                          icon: const Icon(
                            Icons.remove, 
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 50),
                        IconButton(
                          onPressed: () => {}, 
                          icon: const Icon(
                            Icons.add, 
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:const EdgeInsets.all(25),
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}