import 'package:nedaj/export.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: 'tips'.tr, height: 100, centerTitle: true),
        ],
      ),
    );
  }
}
