import 'package:nedaj/export.dart';

class MainServiceContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  final VoidCallback onTap;

  const MainServiceContainer({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.306,
        height: 163,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 6,
          bottom: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.green.withOpacity(0.25), width: 1),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(10),
              Image.asset(
                imageUrl,
                width: 50,
                height: 50,
              ),
              SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(title,
                    textScaler: TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
              ),
              SizedBox(height: 2),
              Text(
                description,
                textScaler: TextScaler.linear(1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
