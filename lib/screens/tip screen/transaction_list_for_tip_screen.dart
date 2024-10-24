import 'package:nedaj/export.dart';

class TransactionListForTipScreen extends StatelessWidget {
  const TransactionListForTipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactionHistory =
        Transaction.getSampleTransactions();

    final Map<String, List<Transaction>> groupedTransactions =
        Transaction.groupTransactionsByDate(transactionHistory);

    final sortedKeys = groupedTransactions.keys.toList()
      ..sort((a, b) {
        if (a == 'Today') return -1;
        if (b == 'Today') return 1;
        if (a == 'Yesterday') return -1;
        if (b == 'Yesterday') return 1;
        return b.compareTo(a);
      });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Give Tip',textScaler: TextScaler.linear(1),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontSize: 20,
              ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List of transactions',textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                ),
                SizedBox(height: 3),
                Text(
                  'Select a transaction from the list and send a tip',textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: sortedKeys.map((dateKey) {
                  final transactions = groupedTransactions[dateKey]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 16.0, bottom: 14.0),
                        child: Text(
                          dateKey,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey,
                                    fontSize: 19,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: transactions.length,
                              padding: EdgeInsets.only(top: 10),
                              separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Divider(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];
                                return TransactionContainer(
                                  transactionId: transaction.transactionId,
                                  fuelType: transaction.fuelType,
                                  amount: transaction.amount,
                                  date: transaction.date,
                                  onTap: () {
                                    Get.to(() => AddTipAmountScreen(
                                        transaction: transaction));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
