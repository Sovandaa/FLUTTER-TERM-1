import 'package:flutter/material.dart';
import 'package:flutter_workspace/W9-S1/models/expense.dart';

class ExpensesCard extends StatelessWidget {
  final Category category;
  final double amount;
  const ExpensesCard({super.key, required this.category, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),

        Icon(category.icon, size: 24, color: Colors.black), 
        const SizedBox(height: 4),

        Text(
          category.name.toUpperCase(),
          style: const TextStyle(fontSize: 8, color: Colors.grey),
        ),
      ],
    );
  }
}


