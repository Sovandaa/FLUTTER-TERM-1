import 'package:flutter/material.dart';
import 'package:flutter_workspace/W9-S1/screens/expenses/expense_board.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("Expense deleted!"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () => {
                setState(() {
                  _registeredExpenses.add(expense);
                })
              },
            ),
          duration: const Duration(seconds: 3),
    ));
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }
  
  // // function calculate sum of expense each category
  //   double calculateTotalByCategory(Category category) {
  //     double total = 0.0; 
  //     // Loop through each expense in the registered expenses
  //     for (var expense in _registeredExpenses) {
  //       if (expense.category == category) {
  //         total += expense.amount; 
  //       }
  //     }
  //     return total; 
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Column(
        children: [
          ExpenseDashboard(registeredExpenses: _registeredExpenses),
          
          Expanded(
            child: _registeredExpenses.isEmpty
                ? Center(
                    child: Text(
                      "No expenses found. Start adding some!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  )
                : ExpensesList(
                    expenses: _registeredExpenses,
                    onExpenseRemoved: onExpenseRemoved,
                  ),
          ),
        ],
      ),
    );
  }
}
