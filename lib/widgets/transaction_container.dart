import 'package:nedaj/export.dart';
import 'package:intl/intl.dart';

class TransactionContainer extends StatelessWidget {
  final String transactionId;
  final String fuelType;
  final double amount;
  final DateTime date; 
  const TransactionContainer({
    super.key,
    required this.transactionId,
    required this.fuelType,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green.shade200,
          child: Icon(Icons.arrow_back, color: Colors.green),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transactionId,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              fuelType,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '+ETB $amount',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 21,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              formattedDate,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
