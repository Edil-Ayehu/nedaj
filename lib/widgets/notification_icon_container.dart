import 'package:nedaj/export.dart';

class NotificationIconContainer extends StatelessWidget {
  const NotificationIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: IconButton(
        onPressed: () {
          Get.to(() => NotificationsScreen());
        },
        icon: Icon(
          Icons.notifications_none,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
