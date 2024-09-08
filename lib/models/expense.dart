import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uudi = Uuid();

enum Category { travel, food, work, leisure }

const categoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.travel_explore_rounded,
  Category.work: Icons.work_outline,
  Category.leisure: Icons.movie_creation_outlined,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uudi.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
