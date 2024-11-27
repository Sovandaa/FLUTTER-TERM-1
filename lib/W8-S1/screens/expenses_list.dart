
import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8-S1/models/expense.dart';
import 'package:intl/intl.dart';

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

class ExpenseItem extends StatefulWidget {
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  const ExpenseItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  IconData getCategoryIcon(ExpenseType category) {
    switch (category) {
      case ExpenseType.Food:
        return Icons.fastfood_sharp;
      case ExpenseType.Travel:
        return Icons.card_travel;
      case ExpenseType.Leisure:
        return Icons.movie;
      case ExpenseType.Work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMd().format(widget.date);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 8.0),
                Text("\$${widget.amount}", style: TextStyle(fontSize: 14),)
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(getCategoryIcon(widget.category)),
                SizedBox(width: 10),
                Text(date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
