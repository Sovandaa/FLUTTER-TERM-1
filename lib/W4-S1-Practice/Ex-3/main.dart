// The Buttons

import 'package:flutter/material.dart';

// enum ButtonType {
//   Color color;

//   const ButtonType ({this.color});
  
// }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Custom Buttons"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                // style: TextButton.styleFrom(
                //   Primary: Colors.blue,
                //   Secondary: Colors.green,
                //   Disabled: Colors.grey
                // ),
                onPressed: () {}, 
                // Icon(
                //   Icons.check,
                //   color: Colors.grey,
                //   size: 24.0,
                //   ),
                // const SizedBox(width: 20.0),
                child:const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    ),
  ));
}
