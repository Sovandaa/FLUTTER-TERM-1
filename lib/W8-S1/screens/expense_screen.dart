import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8-S1/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
    title: "Flutter Course",
    amount: 19.99,
    date: DateTime.now(),
    category: ExpenseType.Work
    ),

    Expense(
    title: "Flutter Course",
    amount: 15.99,
    date: DateTime.now(),
    category: ExpenseType.Work
    ),

  ];

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Ronan-The-Best Expenses App"),

        actions: [
          TextButton(
            onPressed: (){}, 
            child: Icon(
              Icons.add,
              color: Colors.black,
            )
          ),
        ],
      ),
      
    );
  }
}

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

      ],
    );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text("Flutter Course"),
              Text("\$19.99")
            ],
          ),
          Icon(Icons.school)
        ],
      ),
    );
  }
}
