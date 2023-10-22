import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final void Function(Expense) onExpenseRemoved;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, ind) => Dismissible(
            background: Container(
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            key: ValueKey(expenses[ind]),
            onDismissed: (dd) => onExpenseRemoved(expenses[ind]),
            child: ExpenseItem(expense: expenses[ind])));
  }
}
