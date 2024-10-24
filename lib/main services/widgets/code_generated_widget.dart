import 'package:nedaj/export.dart';

class CodeGeneratedWidget extends StatelessWidget {
  final String code;
  final String car;
  final String fuelType;
  final String amount;

  const CodeGeneratedWidget({
    super.key,
    required this.code,
    required this.car,
    required this.fuelType,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(45),
            Image.asset(
              'assets/images/success_image.png',
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            Gap(20),
            Center(
              child: Text(
                'Stand by Code generated Successfully!',
                textScaler: TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
              ),
            ),
            Gap(20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              child: Column(
                children: [
                  Text(
                    'Your Payment Code',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  Gap(10),
                  Text(
                    code,
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xff16553A),
                        ),
                  ),
                ],
              ),
            ),
            Gap(20),
            PaymentDetailsContainer(
              car: car,
              fuelType: fuelType,
              amount: amount,
              currentUserFullName: 'Abel Tesfaye Girma',
            ),
            Gap(80),
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
                    textScaler: TextScaler.linear(1),
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
