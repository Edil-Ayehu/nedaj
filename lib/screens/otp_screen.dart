import '../export.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('OTP'),
      ),
    );
  }
}
