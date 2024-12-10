import 'package:flutter/material.dart';
import 'package:flutter_workspace/W9-S1/models/expense.dart';
import 'package:flutter_workspace/W9-S1/screens/expenses/expense_card.dart';

class ExpenseDashboard extends StatelessWidget {
  final List<Expense> registeredExpenses;
  const ExpenseDashboard({super.key, required this.registeredExpenses});

    // function calculate sum of expense each category
    double calculateTotalByCategory(Category category) {

      double total = 0.0; 
      // Loop through each expense in the registered expenses
      for (var expense in registeredExpenses) {
        if (expense.category == category) {
          total += expense.amount; 
        }
      }
      return total; 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.all(25),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Category.values.map((category) {
              return Padding(
                padding: const EdgeInsets.all(8), // Padding for spacing
                child: ExpensesCard(
                  category: category,
                  amount: calculateTotalByCategory(category),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}