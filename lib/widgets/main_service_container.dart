import 'package:nedaj/export.dart';

class MainServiceContainer extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const MainServiceContainer({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.3,
        height: 170,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 6,
          bottom: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(icon, color: Colors.white),
              ),
              SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(title,
                    textScaler: TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
              ),
              SizedBox(height: 6),
              Text(
                description,
                textScaler: TextScaler.linear(1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
