// The Buttons

import 'package:flutter/material.dart';

enum ButtonType { Primary, Secondary, Disabled }

enum IconPosition { left, right }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom Buttons"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                buttonType: ButtonType.Primary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: "Time",
                icon: Icons.access_time,
                buttonType: ButtonType.Secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: "Account",
                icon: Icons.account_tree,
                buttonType: ButtonType.Disabled,
                iconPosition: IconPosition.right,
              )
            ],
          ),
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  // const CustomButton({
  //   super.key,
  // });
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.Primary,
  });

  Color getButtonColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.Primary:
        return Colors.blue;
      case ButtonType.Secondary:
        return Colors.green;
      case ButtonType.Disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: getButtonColor(buttonType),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left)
            Icon(icon, color: Colors.black45),
          SizedBox(width: 8.0),

          Text(label, style: TextStyle(color: Colors.black45)),

          if (iconPosition == IconPosition.right)
            SizedBox(width: 8.0), // Spacing between text and icon
          Icon(icon, color: Colors.black45),

          // Icon( icon, color: Colors.black45),
          // SizedBox(width: 8.0),
          // Text(label, style: TextStyle(color: Colors.black45)),
        ],
      ),
    );
  }
}
