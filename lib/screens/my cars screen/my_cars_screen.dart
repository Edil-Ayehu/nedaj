import 'package:nedaj/export.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hasRegisteredCars = Car.registeredVehicles.isNotEmpty;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: hasRegisteredCars
            ? FloatingActionButton.extended(
                foregroundColor: Colors.white,
                backgroundColor: Constants.primaryColor,
                onPressed: () {
                  Get.to(() => RegisterCarScreen());
                },
                label: Text('Register Car',textScaler: TextScaler.linear(1),),
                icon: Icon(Icons.add),
              )
            : null,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'my_cars'.tr,textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 22,
                ),
          ),
        ),
        body: hasRegisteredCars ? _buildCarList(context) : EmptyCarWidget(),
      ),
    );
  }

  Widget _buildCarList(BuildContext context) {
    return Column(
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
                onTap: () => _showBottomSheet(context, vehicle),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, Car car) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          // padding: EdgeInsets.all(12),
          padding: EdgeInsets.only(bottom: 12, left: 12, right: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/my_car_image.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 14),
              Text(
                'Manage my Car',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.grey.shade100,
                leading: Icon(FluentIcons.edit_line_horizontal_3_20_filled,
                    color: Constants.primaryColor),
                title: Text(
                  'Edit my Car',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Constants.primaryColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterCarScreen(carToEdit: car),
                    ),
                  );
                  // Add edit car logic here
                },
              ),
              Gap(10),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.grey.shade100,
                leading: Icon(FluentIcons.delete_24_filled,
                    color: Constants.primaryColor),
                title: Text(
                  'Delete my Car',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Constants.primaryColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // _showLogoutDialog(context);
                  _showCustomDialog(
                    context,
                    'assets/images/my_car_image.png',
                    'Delete Car',
                    'Are you sure you want to delete this car?',
                    'Cancel',
                    'Delete',
                    () {},
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCustomDialog(
    BuildContext context,
    String imagePath,
    String title,
    String message,
    String cancelButtonText,
    String actionButtonText,
    VoidCallback onActionPressed,
  ) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: GestureDetector(
                  onTap: () {}, // Prevent taps from closing the dialog
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            imagePath,
                            height: 40,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
                            title,
                            textScaler: TextScaler.linear(1),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 24,
                                ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            message,
                            textScaler: TextScaler.linear(1),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Constants.primaryColor,
                                  side:
                                      BorderSide(color: Constants.primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(cancelButtonText,textScaler: TextScaler.linear(1),),
                                ),
                                onPressed: () {
                                  overlayEntry?.remove();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(actionButtonText,textScaler: TextScaler.linear(1),),
                                ),
                                onPressed: () {
                                  overlayEntry?.remove();
                                  onActionPressed();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);
  }
}
