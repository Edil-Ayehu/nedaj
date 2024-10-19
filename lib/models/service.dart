import 'package:flutter/cupertino.dart';
import 'package:nedaj/export.dart';

class Service {
  final String title;
  final String description;
  final VoidCallback onTap;
  final String imageUrl;

  Service({
    required this.title,
    required this.description,
    required this.onTap,
    required this.imageUrl,
  });

  // Factory constructor to create a Service instance from a Map
  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      title: data['title'],
      description: data['description'],
      onTap: data['onTap'],
      imageUrl: data['imageUrl'],
    );
  }

  // Static method to return a list of transactions
  static List<Service> getServices() {
    return [
      Service(
        title: 'my_cars'.tr,
        description: 'Your registered cars listed here.',
        onTap: () {
          Get.to(
            () => MyCarsPage(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 200),
          );
        },
        imageUrl: 'assets/icons/my_cars_icon.png',
      ),
      Service(
        title: 'fuel_stations'.tr,
        description: 'Find nearby fuel stations',
        onTap: () {},
        imageUrl: 'assets/icons/fuel_stations_icon.png',
      ),
      Service(
        title: 'tips'.tr,
        description: 'You can give a tip for an attendant.',
        onTap: () {
          Get.to(
            () => TipsScreen(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 200),
          );
        },
        imageUrl: 'assets/icons/tips_icon.png',
      ),
    ];
  }
}
