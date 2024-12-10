import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;
  Category dropDownValue = Category.food; // dropdown
  DateTime? selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double? amount = double.tryParse(_valueController.text);

    // 2- Validate input
    bool isTitleValid = title.trim().isNotEmpty; // true
    bool isAmountValid = amount != null && amount > 0; // true
    bool valid = isTitleValid && isAmountValid;

    if (valid) {
      // 3.1- Create the expense
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: selectedDate!, //  TODO :  Done
          category: dropDownValue); //  TODO :  Done

      // 3.2- Ask the parent to add the expense
      widget.onCreated(expense);
      // 3.3- Close modal
      Navigator.pop(context);
    } else {
      // 4- compute msg error when false
      String errorMsg = !isTitleValid
          ? "The title cannot be empty"
          : "The amount shall be a positive number";

      // 4.1- show error
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: Text(errorMsg),
          actions: [
            TextButton(
              onPressed: () => {
                Navigator.pop(ctx),
              }, child: const Text("Okay"),
            ),
          ],
        ),
      );
    }

    // if (title.isEmpty) {
    //   showAlert('Invalid input', 'The title cannot be empty.');
    //   return;
    // }else if (amount == _valueController.text.isEmpty) {
    //   showAlert('Invalid input', 'The amount must be a positive number.');
    //   return;
    // }
  }

  // Method show date picker
  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2100));
    // check if user selected a date (trigger)
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // show dialog function
  void showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          // Impelement date picker
          Row(
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                selectedDate == null
                    ? "No date selected"
                    : "${selectedDate!.toLocal()}".split(" ")[0],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                  onPressed: pickDate, icon: const Icon(Icons.calendar_month)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Dropdown button to display selected category
              DropdownButton<Category>(
                value: dropDownValue,
                iconSize: 25.0,
                onChanged: (Category? selectedValue) => {
                  setState(() {
                    dropDownValue = selectedValue!;
                  })
                },
                items: Category.values.map((Category newValue) {
                  return DropdownMenuItem<Category>(
                      value: newValue,
                      child: Text(
                        newValue.name.toUpperCase(),
                      ));
                }).toList(),
              ),

              Spacer(),

              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),

              ElevatedButton(
                onPressed: onAdd,
                // onPressed: () => {

                // },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                ),
                child: const Text(
                  'Save Expense',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
