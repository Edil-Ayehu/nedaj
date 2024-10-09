import 'package:nedaj/export.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('OTP'),
      ),
    );
  }
}
