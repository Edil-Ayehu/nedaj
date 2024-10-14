import 'package:nedaj/export.dart';

class MainServicesContainer extends StatelessWidget {
  const MainServicesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainServiceContainer(
          title: 'Stand By',
          description: 'Set all process before arriving',
          icon: Icons.rocket_launch_outlined,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return StandByCodePage();
                },
              ),
            );
          },
        ),
        MainServiceContainer(
          title: 'Direct Pay',
          description: 'Pay by fuel station ID',
          icon: Icons.payments_outlined,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DirectPayPage();
                },
              ),
            );
          },
        ),
        MainServiceContainer(
          title: 'Pay by QR',
          description: 'Directly pay by station QR',
          icon: Icons.qr_code_scanner,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return PayByQr();
              },
            ));
          },
        ),
      ],
    );
  }
}
