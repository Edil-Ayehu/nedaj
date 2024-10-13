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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Icon(CupertinoIcons.car_detailed, size: 50),
          ),
          Gap(25),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Added on: ',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          addedTime,
                          textScaler: TextScaler.linear(1),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(3),
                Row(
                  children: [
                    Text(
                      'Code: ',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    Text(
                      '$code',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
                Gap(3),
                Row(
                  children: [
                    Text(
                      'Region: ',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    Text(
                      region,
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(16),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '$plateNumber',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
