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
            textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 19,
                ),
          ),
          Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer Name:',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
              ),
              Text(
                currentUserFullName,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
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
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
              ),
              Text(
                car,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
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
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
              ),
              Text(
                fuelType,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
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
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
              ),
              Text(
                '$amount Birr',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
