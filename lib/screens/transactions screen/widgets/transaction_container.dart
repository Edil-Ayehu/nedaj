import 'package:nedaj/export.dart';
import 'package:intl/intl.dart';

class TransactionContainer extends StatelessWidget {
  final String transactionId;
  final String fuelType;
  final double amount;
  final DateTime date;
  final VoidCallback onTap;
  const TransactionContainer({
    super.key,
    required this.transactionId,
    required this.fuelType,
    required this.amount,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM d, yyyy h:mm a').format(date);
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/transaction_icon.png',
            width: 45,
            height: 45,
          ),
          Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transactionId,
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16)),
              Text(
                fuelType,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('ETB $amount',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                      )),
              Text(
                formattedDate,
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
