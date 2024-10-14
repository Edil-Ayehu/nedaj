import 'package:nedaj/export.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: 'Change PIN', height: 100, centerTitle: true),
        ],
      ),
    );
  }
}
