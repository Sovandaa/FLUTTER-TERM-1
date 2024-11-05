import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: 350,
        height: 80,
        child: ElevatedButton(
            onPressed: () {
              setState(() { // switches between true and false (call when press btn)
                isSelected = !isSelected;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.lightBlue[50],
            ),
            child: Center(
              child: Text(
                isSelected ? 'Selected' : 'Not Selected',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            )),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Statefull widget - Button"),
        ),
        body: const Center(
          child: Column(
            children: [
              CustomButton(),
              CustomButton(),
              CustomButton(),
              CustomButton(),
            ],
          )
          
        ),
      ),
    ));
