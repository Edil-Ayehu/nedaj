import 'package:nedaj/export.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
              title: 'Terms and Conditions', height: 100, centerTitle: true),
        ],
      ),
    );
  }
}
