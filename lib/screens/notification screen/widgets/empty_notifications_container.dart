import 'package:nedaj/export.dart';

class EmptyNotificationsContainer extends StatelessWidget {
  const EmptyNotificationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.08),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_notification_page_image.png',
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'No Notifications Yet!',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Your notification will appear here once you\'ve received them.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
              ),
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}
