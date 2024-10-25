import 'package:nedaj/export.dart';

class SemiTransparentContainer extends StatelessWidget {
  const SemiTransparentContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.13),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Row(
              children: [
                Flexible(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nedaj',
                        textScaler: TextScaler.linear(1),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Fuel up fast with Nedaj—pay for your fuel securely & conveniently, anytime, anywhere!',
                        textScaler: TextScaler.linear(1),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/fuel_image.png',
                    fit: BoxFit.cover,
                    // width: 75,
                    // height: 75,
                  ),
                ),
              ],
            ),
          ),
          Gap(2),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/large_car_image.png',
              fit: BoxFit.cover,
              height: 117,
            ),
          ),
        ],
      ),
    );
  }
}