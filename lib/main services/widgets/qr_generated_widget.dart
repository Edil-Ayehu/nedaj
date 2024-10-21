import 'package:nedaj/export.dart';
import 'package:nedaj/main%20services/widgets/payment_details_container.dart';
import 'package:nedaj/utils/constants.dart';

class QrGeneratedWidget extends StatelessWidget {
  final String car;
  final String fuelType;
  final String amount;
  final String customerName;

  const QrGeneratedWidget({
    super.key,
    required this.car,
    required this.fuelType,
    required this.amount,
    required this.customerName,
  });

  String _generateQrData() {
    return 'CustomerName: $customerName\nCar: $car\nFuel Type: $fuelType\nAmount: $amount Birr';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/success_image.png',
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
            Gap(20),
            Center(
              child: Text(
                'QR Code Generated Successfully!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade50,
              ),
              child: Column(
                children: [
                  Text(
                    'Your Payment QR Code',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  Gap(10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: QrImageView(
                      data: _generateQrData(),
                      version: QrVersions.auto,
                      size: 200.0, // Adjust the size of the QR code
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            PaymentDetailsContainer(
              car: car,
              fuelType: fuelType,
              amount: amount,
              currentUserFullName: customerName,
            ),
            Gap(20),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                  )),
            ),
            Gap(24),
          ],
        ),
      ),
    );
  }
}
