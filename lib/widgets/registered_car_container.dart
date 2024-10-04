import 'package:flutter/cupertino.dart';
import 'package:nedaj/export.dart';

class RegisteredCarContainer extends StatelessWidget {
  final String addedTime;
  final String region;
  final int code;
  final int plateNumber;
  const RegisteredCarContainer({
    super.key,
    required this.addedTime,
    required this.region,
    required this.code,
    required this.plateNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.car_detailed, size: 60),
          Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Added on: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    addedTime,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              Gap(3),
              Row(
                children: [
                  Text(
                    'Code: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    '$code',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              Gap(3),
              Row(
                children: [
                  Text(
                    'Region: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    region,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$plateNumber',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
