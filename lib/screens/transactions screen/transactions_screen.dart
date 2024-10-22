import 'package:nedaj/export.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactionHistory =
        Transaction.getSampleTransactions();

    if (transactionHistory.isEmpty) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              CustomAppBar(
                title: 'transactions'.tr,
                height: 100,
                trailing: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => NotificationsScreen());
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: 25,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: EmptyTransactionsContainer(),
              ),
            ],
          ),
        ),
      );
    }

    final Map<String, List<Transaction>> groupedTransactions =
        Transaction.groupTransactionsByDate(transactionHistory);

    // Sort the keys to ensure 'Today' and 'Yesterday' appear first
    final sortedKeys = groupedTransactions.keys.toList()
      ..sort((a, b) {
        if (a == 'Today') return -1;
        if (b == 'Today') return 1;
        if (a == 'Yesterday') return -1;
        if (b == 'Yesterday') return 1;
        return b.compareTo(a); // For other dates, sort in descending order
      });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            CustomAppBar(
              title: 'transactions'.tr,
              height: 100,
              trailing: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => NotificationsScreen());
                  },
                  icon: Icon(
                    Icons.notifications_none,
                    size: 25,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Gap(8),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    children: sortedKeys.map((dateKey) {
                      final transactions = groupedTransactions[dateKey]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 0, bottom: 14.0),
                            child: Text(
                              dateKey,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 19,
                                  ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: transactions.length,
                              padding: EdgeInsets.only(top: 10),
                              separatorBuilder: (context, index) => Divider(
                                color: Colors.grey.shade200,
                              ),
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];
                                return TransactionContainer(
                                  transactionId: transaction.transactionId,
                                  fuelType: transaction.fuelType,
                                  amount: transaction.amount,
                                  date: transaction.date,
                                  onTap: transaction.onTap,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
