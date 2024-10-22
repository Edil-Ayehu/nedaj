import 'package:nedaj/export.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          backgroundColor: Constants.primaryColor,
          onPressed: () {},
          label: Text('Register Car'),
          icon: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'my_cars'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 22,
                ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                'Your Registered Cars',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                'List of your cars linked to your bank account.',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
              ),
            ),
            Gap(16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: Car.registeredVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = Car.registeredVehicles[index];
                  return RegisteredCarContainer(
                    addedTime: vehicle.addedTime,
                    region: vehicle.region,
                    code: vehicle.code,
                    plateNumber: vehicle.plateNumber,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
