import 'package:nedaj/export.dart';
import 'package:nedaj/models/notification_model.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationModel.notifications;

    // Sort notifications in descending order (most recent first)
    notifications.sort((a, b) => b.date.compareTo(a.date));
    final groupedNotifications = _groupNotificationsByDate(notifications);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: groupedNotifications.length,
        itemBuilder: (context, index) {
          final date = groupedNotifications.keys.elementAt(index);
          final notificationsForDate = groupedNotifications[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  _formatDate(date),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              ...notificationsForDate
                  .map((notification) =>
                      _buildNotificationCard(context, notification))
                  .toList(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, NotificationModel notification) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/notification_bell_icon.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 19,
                        ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    notification.description,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    _formatDateTime(notification.date),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<DateTime, List<NotificationModel>> _groupNotificationsByDate(
      List<NotificationModel> notifications) {
    return groupBy(
        notifications,
        (notification) => DateTime(notification.date.year,
            notification.date.month, notification.date.day));
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, y').format(date);
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, y h:mm a').format(dateTime);
  }
}
