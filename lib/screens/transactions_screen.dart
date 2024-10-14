import 'package:nedaj/export.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch transaction history from Transaction model
    final List<Transaction> transactionHistory =
        Transaction.getSampleTransactions();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          CustomAppBar(title: 'transactions'.tr, height: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: transactionHistory.length,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final transaction = transactionHistory[index];
                          return Column(
                            children: [
                              TransactionContainer(
                                transactionId: transaction.transactionId,
                                fuelType: transaction.fuelType,
                                amount: transaction.amount,
                                date: transaction.date,
                                onTap: transaction.onTap,
                              ),
                              Gap(10),
                              if (index != transactionHistory.length - 1)
                                Divider(
                                  color: Colors.grey.shade300,
                                ),
                              Gap(10),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
