import 'package:nedaj/export.dart';

class MainServicesListWidget extends StatelessWidget {
  const MainServicesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainServiceContainer(
          title: 'Stand By',
          description: 'Pay by payment code',
          imageUrl: 'assets/images/stand_by_icon.png',
          onTap: () {
            Get.to(() => StandByCodePage());
          },
        ),
        MainServiceContainer(
          title: 'Pay by QR',
          description: 'Pay by QR code',
          imageUrl: 'assets/images/pay_by_qr_img.png',
          onTap: () {
            Get.to(() => PayByQrGeneratePage());
          },
        ),
        MainServiceContainer(
          title: 'OTPs',
          description: 'OTPs for your payment',
          imageUrl: 'assets/images/otps_image.png',
          onTap: () {
            Get.to(() => OtpScreen());
          },
        ),
      ],
    );
  }
}
