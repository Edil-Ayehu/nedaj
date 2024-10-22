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

  Color _getColorForCode(int code) {
    switch (code) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      case 4:
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final codeColor = _getColorForCode(code);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/my_car_image.png',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          Gap(15),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Code:  ',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: codeColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '$code',
                        textScaler: TextScaler.linear(1),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: codeColor,
                              fontSize: 15,
                            ),
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
                            color: Colors.black,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Added on: ',
                      textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.grey,
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
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(3),
              ],
            ),
          ),
          Gap(16),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: codeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '$plateNumber',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: codeColor,
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
