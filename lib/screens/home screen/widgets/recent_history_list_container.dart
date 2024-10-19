import 'package:nedaj/export.dart';

class RecentHistoryListContainer extends StatelessWidget {
  RecentHistoryListContainer({super.key});

  // Fetch transaction history from Transaction model
  final List<Transaction> transactionHistory =
      Transaction.getSampleTransactions();

  @override
  Widget build(BuildContext context) {
    if (transactionHistory.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Image.asset(
            //   'assets/images/empty_transaction_icon.png',
            //   width: 100,
            //   height: 100,
            // ),
            // Gap(10),
            Text(
              'No recent transactions',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(5),
            Text(
              'Your recent transactions will appear here',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      );
    }

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
                Divider(
                  color: Colors.grey.shade300,
                ),
              Gap(10),
            ],
          );
        },
      ),
    );
  }
}
