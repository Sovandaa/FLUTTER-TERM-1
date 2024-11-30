import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DeviceType { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  DeviceType dropDownValue = DeviceType.riels; // default value

  final _amountController = TextEditingController();
  double convertAmount = 0.0;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }

  double convertDevice(amount) {
    switch (dropDownValue) {
      case DeviceType.dong:
        return amount * 25000;
      case DeviceType.euro:
        return amount * 0.95;
      case DeviceType.riels:
        return amount * 4100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),

          TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),

          const SizedBox(height: 30),

          const Text("Device:"), // TODO: device enum type
          DropdownButton<DeviceType>(
            value: dropDownValue,
            onChanged: (DeviceType? selectedValue) => {
              setState(() {
                dropDownValue = selectedValue!;
                double amount =
                    double.tryParse(_amountController.text) ?? 0.0; // dollar
                convertAmount = convertDevice(amount);
              })
            },
            items: DeviceType.values.map((DeviceType newValue) {
              return DropdownMenuItem<DeviceType>(
                value: newValue,
                child: Text(newValue.name.toUpperCase()),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(convertAmount.toString()))
        ],
      )),
    );
  }
}
