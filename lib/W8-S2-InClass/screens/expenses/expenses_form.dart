import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
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
              label: Text('Title!'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: _amountController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefix: Text('\$ '),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () =>{
                Navigator.pop(context),
              }, 
              child: const Text("Cancel")),
              SizedBox(width: 10),

              ElevatedButton(
              onPressed: () => {
                    print("Title: ${_titleController.text}"),
                    print("Amount: ${_amountController.text}"),
                  },
              child: const Text('Check value')),
              
            ],
          )

          
        ],
      ),
    );
  }
}
