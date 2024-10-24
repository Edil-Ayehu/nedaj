import 'package:nedaj/export.dart';

class MainServicesCustomAppBar extends StatelessWidget {
  final String title;
  const MainServicesCustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width,
      padding: EdgeInsets.only(top: 14, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 26,
              color: Colors.black,
            ),
          ),
          Text(
            title,
            textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                ),
          ),
        ],
      ),
    );
  }
}
