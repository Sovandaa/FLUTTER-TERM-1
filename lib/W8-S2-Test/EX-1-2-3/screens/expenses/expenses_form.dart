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
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate!, //  TODO :  Done
        category: dropDownValue); //  TODO :  Done

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
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
                onPressed: pickDate, 
                icon: const Icon(Icons.calendar_month)
              ),
              
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                ),
                child: const Text('Save Expense', style: TextStyle(color: Colors.grey),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
