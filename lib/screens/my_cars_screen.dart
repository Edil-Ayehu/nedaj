import 'package:nedaj/export.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark, // For light icons
        statusBarBrightness: Brightness.light, // For dark background
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // back arrow
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Gap(10),
            // register car button
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    'register_car'.tr,
                    textScaler: TextScaler.linear(1),
                  ),
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'registered_vehicles'.tr,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'linked_cars'.tr,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
              ),
            ),
            Gap(16),

            // list of registered cars

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
