import 'package:nedaj/export.dart';
import 'package:nedaj/screens/transaction_details_screen.dart';

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
      onTap: map['onTap']
    );
  }

  // Static method to return a list of transactions
  static List<Transaction> getSampleTransactions() {
    return [
      Transaction(
        transactionId: 'A023219',
        fuelType: 'Gasoil',
        amount: 4500.0,
        date: DateTime.now(),
        onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
      Transaction(
        transactionId: 'A023220',
        fuelType: 'Petrol',
        amount: 500.0,
        date: DateTime.now(),
         onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
      Transaction(
        transactionId: 'A023221',
        fuelType: 'Gasoil',
        amount: 400.0,
        date: DateTime.now(),
         onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
      Transaction(
        transactionId: 'A023222', 
        fuelType: 'Gasoil',
        amount: 200.0,
        date: DateTime.now(),
         onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
      Transaction(
        transactionId: 'A023223',
        fuelType: 'Gasoil',
        amount: 100.0,
        date: DateTime.now(),
         onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
      Transaction(
        transactionId: 'A023224',
        fuelType: 'Gasoil',
        amount: 900.0,
        date: DateTime.now(),
         onTap: () {
        Get.to(()=> TransactionDetailsScreen());
      },
      ),
    ];
  }
}
