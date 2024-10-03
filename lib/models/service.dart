import 'package:nedaj/export.dart';

class Service {
  final String title;
  final String description;
  final IconData icon;

  Service({
    required this.title,
    required this.description,
    required this.icon,
  });

  // Factory constructor to create a Service instance from a Map
  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      title: data['title'],
      description: data['description'],
      icon: data['icon'],
    );
  }

  // Static method to return a list of transactions
  static List<Service> getServices() {
    return [
      Service(
        title: 'OTP',
        description: 'Your registered cars listed here.',
        icon: Icons.qr_code,
      ),
      Service(
        title: 'My Cars',
        description: 'Your registered cars listed here.',
        icon: Icons.qr_code,
      ),
      Service(
        title: 'Tips',
        description: 'You can give a tip for an attendant.',
        icon: Icons.qr_code,
      ),
      Service(
        title: 'Fuel Stations',
        description: 'You can find fuel available at nearby fuel stations.',
        icon: Icons.qr_code,
      ),
    ];
  }
}
