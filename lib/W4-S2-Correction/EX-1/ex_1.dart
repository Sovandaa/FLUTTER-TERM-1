import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Statefull widget - Button"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              SizedBox(height: 10,),
              SelectableButton(),
               SizedBox(height: 10,),
              SelectableButton(),
               SizedBox(height: 10,),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const SelectableButton({
    super.key,
  });

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  Color noSelectedColor = Colors.blue[50] as Color;
  Color selectedColor = Colors.blue[500] as Color;

  String get textLabel => isSelected ? "Selected" : "Not selected";
  Color get backgroundColor => isSelected ? selectedColor : noSelectedColor;
  Color get textColor => isSelected ? Colors.white : Colors.black;

  void onClick() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: onClick,
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          )),
    );
  }
}
