import 'package:nedaj/export.dart';
import 'package:nedaj/models/car_model.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // back arrow
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
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
                label: Text('register_car'.tr),
                icon: Icon(Icons.add),
              ),
            ),
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'registered_vehicles'.tr,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 22,
                  ),
            ),
          ),
          Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'linked_cars'.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            ),
          ),
          Gap(16),
          // registered car container

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
    );
  }
}
