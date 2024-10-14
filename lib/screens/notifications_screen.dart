import 'package:nedaj/export.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
              title: 'Notifications', height: 100, centerTitle: true),
        ],
      ),
    );
  }
}
