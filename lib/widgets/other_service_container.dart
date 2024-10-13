import 'package:nedaj/export.dart';

class OtherServiceContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  const OtherServiceContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                icon,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    textScaler: TextScaler.linear(1),
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
