
import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8-S1/models/expense.dart';
import 'package:flutter_workspace/W8-S1/screens/expense_item.dart';


class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ExpenseItem(
              title: expenses[index].title,
              amount: expenses[index].amount,
              date: expenses[index].date,
              category: expenses[index].category
            );
        });
  }
}
