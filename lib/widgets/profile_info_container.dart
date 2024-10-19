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
                Icon(icon, color: Colors.grey.shade800, size: 28),
                SizedBox(width: 16),
                Text(
                  text,
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade900,
                        fontSize: 17,
                      ),
                ),
                Spacer(),
                Icon(Icons.navigate_next, color: Colors.grey.shade900),
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
