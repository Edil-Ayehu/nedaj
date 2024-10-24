import 'package:nedaj/export.dart';

class EmptyTransactionsContainer extends StatelessWidget {
  const EmptyTransactionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_transaction_image.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'No Fuel Transactions Yet',textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Gap(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You haven\'t made any fuel transactions yet. Once you fill up, your transaction history will appear here for easy reference.',textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
