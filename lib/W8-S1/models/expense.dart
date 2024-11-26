import 'package:uuid/uuid.dart';

enum ExpenseType { Food, Travel, Liesure, Work }

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({required this.title, required this.amount, required this.date,required this.category})
      : this.id = uuid.v4();
}
