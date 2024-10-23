import 'package:nedaj/export.dart';
import 'package:intl/intl.dart';

class TipContainer extends StatelessWidget {
  final double tipAmount;
  final DateTime tipDate;
  const TipContainer({
    super.key,
    required this.tipAmount,
    required this.tipDate,
  });

  @override
  Widget build(BuildContext context) {
    // Use 'MMM' for abbreviated month names
    final formattedDate = DateFormat('MMM d, yyyy').format(tipDate);

    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'assets/icons/tips_icon.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Amount: ',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                    Text(tipAmount.toStringAsFixed(2),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                              fontSize: 19,
                            )),
                  ],
                ),
                Gap(5),
                Text(
                  'Solomon Kebebe',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                ),
              ],
            ),
            Spacer(),
            Text(
              formattedDate,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
