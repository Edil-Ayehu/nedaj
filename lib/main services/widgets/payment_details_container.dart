import 'package:nedaj/export.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({
    super.key,
    required this.car,
    required this.fuelType,
    required this.amount,
    required this.currentUserFullName,
  });

  final String car;
  final String fuelType;
  final String amount;
  final String currentUserFullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade100, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Details:',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20,
                ),
          ),
          Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer Name:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
              ),
              Text(
                currentUserFullName,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                    ),
              ),
            ],
          ),
          Gap(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Car:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
              ),
              Text(
                car,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                    ),
              ),
            ],
          ),
          Gap(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fuel Type:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
              ),
              Text(
                fuelType,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                    ),
              ),
            ],
          ),
          Gap(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
              ),
              Text(
                '$amount Birr',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 19,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
