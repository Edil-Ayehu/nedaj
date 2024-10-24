import 'package:nedaj/export.dart';

class RecentHistoryListContainer extends StatelessWidget {
  RecentHistoryListContainer({super.key});

  // Fetch transaction history from Transaction model
  final List<Transaction> transactionHistory =
      Transaction.getSampleTransactions();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:
            transactionHistory.length > 4 ? 4 : transactionHistory.length,
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
              if (index != transactionHistory.length - 1 && index != 3)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    color: Colors.grey.shade200,
                  ),
                ),
              Gap(10),
            ],
          );
        },
      ),
    );
  }
}
