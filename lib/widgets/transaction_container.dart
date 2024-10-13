import 'dart:math';

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
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green.shade200,
              child: Transform.rotate(
                angle: pi / 4, // 45 degrees rotation
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                  size: 30,
                ), // Upward arrow, rotated to north-east
              ),
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
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('+ETB $amount',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        )),
                Text(
                  formattedDate,
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
