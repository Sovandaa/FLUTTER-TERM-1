import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            color: Colors.blue,
            height: 300,
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: 
                Container(
                  color: Colors.green,
                )),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                )
              ],
            ),
          ),
          
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:Container(
                  // width: 100,
                  color: Colors.yellowAccent,
                )),
                const SizedBox(width: 20),
                
                Expanded(child:Container(
                  // width: 100,
                  color: Colors.yellowAccent,
                )),
                SizedBox(width: 20),

                Expanded(child:Container(
                  // width: 100,
                  color: Colors.yellowAccent,
                )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container(
            color: Colors.pink,
          ))
        ],
      ),
    ),
  ));
}
