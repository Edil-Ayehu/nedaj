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
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                text,
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
    );
  }
}
