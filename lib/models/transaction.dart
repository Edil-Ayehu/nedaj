class Transaction {
  final String transactionId;
  final String fuelType;
  final double amount;
  final DateTime date;

  Transaction({
    required this.transactionId,
    required this.fuelType,
    required this.amount,
    required this.date,
  });

  // Convert a Map to a Transaction object
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      transactionId: map['transactionId'],
      fuelType: map['fuelType'],
      amount: map['amount'],
      date: map['date'],
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
      ),
      Transaction(
        transactionId: 'A023220',
        fuelType: 'Petrol',
        amount: 500.0,
        date: DateTime.now(),
      ),
      Transaction(
        transactionId: 'A023221',
        fuelType: 'Gasoil',
        amount: 400.0,
        date: DateTime.now(),
      ),
      Transaction(
        transactionId: 'A023222',
        fuelType: 'Gasoil',
        amount: 200.0,
        date: DateTime.now(),
      ),
      Transaction(
        transactionId: 'A023223',
        fuelType: 'Gasoil',
        amount: 100.0,
        date: DateTime.now(),
      ),
      Transaction(
        transactionId: 'A023224',
        fuelType: 'Gasoil',
        amount: 900.0,
        date: DateTime.now(),
      ),
    ];
  }
}
