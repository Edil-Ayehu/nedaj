import 'package:flutter/cupertino.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/screens/otp_screen.dart';
import 'package:nedaj/screens/tips_screen.dart';

class Service {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  // Factory constructor to create a Service instance from a Map
  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      title: data['title'],
      description: data['description'],
      icon: data['icon'],
      onTap: data['onTap'],
    );
  }

  // Static method to return a list of transactions
  static List<Service> getServices() {
    return [
      Service(
        title: 'otp'.tr,
        description: 'Your registered cars listed here.',
        icon: Icons.pin,
        onTap: () {
          Get.to(() => OtpScreen());
        },
      ),
      Service(
        title: 'my_cars'.tr,
        description: 'Your registered cars listed here.',
        icon: CupertinoIcons.car_detailed,
        onTap: () {
          Get.to(() => MyCarsPage());
        },
      ),
      Service(
        title: 'tips'.tr,
        description: 'You can give a tip for an attendant.',
        icon: Icons.tips_and_updates_outlined,
        onTap: () {
          Get.to(() => TipsScreen());
        },
      ),
      Service(
        title: 'fuel_stations'.tr,
        description: 'You can find fuel available at nearby fuel stations.',
        icon: Icons.ev_station_outlined,
        onTap: () {},
      ),
    ];
  }
}
