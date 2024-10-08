import 'package:nedaj/export.dart';

class ProfileInfoContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileInfoContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(icon, color: Colors.grey, size: 28),
                SizedBox(width: 16),
                Text(
                  text,
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.navigate_next, color: Colors.grey),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade200),
          ],
        ),
      ),
    );
  }
}
