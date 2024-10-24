import 'package:intl/intl.dart';
import 'package:nedaj/export.dart';

class Transaction {
  final String transactionId;
  final String fuelType;
  final double amount;
  final DateTime date;
  final VoidCallback onTap;

  Transaction({
    required this.transactionId,
    required this.fuelType,
    required this.amount,
    required this.date,
    required this.onTap,
  });

  // Convert a Map to a Transaction object
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        transactionId: map['transactionId'],
        fuelType: map['fuelType'],
        amount: map['amount'],
        date: map['date'],
        onTap: map['onTap']);
  }

  // Static method to return a list of transactions
  static List<Transaction> getSampleTransactions() {
    return [
      Transaction(
        transactionId: 'A023219',
        fuelType: 'Gasoil',
        amount: 4500.0,
        date: DateTime(2024, 6, 13, 8, 45), // June 12, 2024 6:30 AM
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023219',
        fuelType: 'Gasoil',
        amount: 4500.0,
        date: DateTime(2024, 6, 13, 6, 45), // June 12, 2024 6:30 AM
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023219',
        fuelType: 'Gasoil',
        amount: 4500.0,
        date: DateTime(2024, 6, 13, 3, 40), // June 12, 2024 6:30 AM
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023219',
        fuelType: 'Gasoil',
        amount: 4500.0,
        date: DateTime(2024, 6, 13, 14, 45), // June 12, 2024 6:30 AM
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023220',
        fuelType: 'Petrol',
        amount: 500.0,
        date: DateTime(2024, 7, 13, 14, 45),
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023221',
        fuelType: 'Gasoil',
        amount: 400.0,
        date: DateTime(2024, 8, 13, 14, 45),
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023222',
        fuelType: 'Gasoil',
        amount: 200.0,
        date: DateTime(2024, 9, 13, 3, 48),
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023222',
        fuelType: 'Gasoil',
        amount: 200.0,
        date: DateTime(2024, 9, 13, 1, 05),
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023223',
        fuelType: 'Gasoil',
        amount: 100.0,
        date: DateTime(2024, 10, 13, 14, 45),
        onTap: () {},
      ),
      Transaction(
        transactionId: 'A023224',
        fuelType: 'Gasoil',
        amount: 900.0,
        date: DateTime.now(),
        onTap: () {},
      ),
    ];
  }

  static Map<String, List<Transaction>> groupTransactionsByDate(
      List<Transaction> transactions) {
    final Map<String, List<Transaction>> groupedTransactions = {};
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    // Sort transactions by date in descending order (most recent first)
    transactions.sort((a, b) => b.date.compareTo(a.date));

    for (var transaction in transactions) {
      String dateKey;
      if (transaction.date.year == now.year &&
          transaction.date.month == now.month &&
          transaction.date.day == now.day) {
        dateKey = 'Today';
      } else if (transaction.date.year == yesterday.year &&
          transaction.date.month == yesterday.month &&
          transaction.date.day == yesterday.day) {
        dateKey = 'Yesterday';
      } else {
        dateKey = DateFormat('MMMM d, yyyy').format(transaction.date);
      }

      if (!groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey] = [];
      }
      groupedTransactions[dateKey]!.add(transaction);
    }

    return groupedTransactions;
  }
}
