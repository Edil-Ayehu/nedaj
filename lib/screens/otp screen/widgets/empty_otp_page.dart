import 'package:nedaj/export.dart';

class EmptyOtpPage extends StatelessWidget {
  const EmptyOtpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.8,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_otp_image.png',
            fit: BoxFit.cover,
          ),
          Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'No OTPs Available',textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 26,
                  ),
            ),
          ),
          Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'You have no OTPs listed yet. Once you make a transaction, your OTPs will appear here for easy access.',
              textScaler: TextScaler.linear(1),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
