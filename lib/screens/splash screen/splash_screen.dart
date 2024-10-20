import 'dart:async';
import 'package:nedaj/auth/screens/login_screen.dart';
import 'package:nedaj/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer and navigate to the home screen after 3 seconds
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              height: constraints.maxHeight,
              color: Colors.white,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: Image.asset('assets/images/nedaj_lgo.png'),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 70,
                    right: 70,
                    child: Center(
                      child: Image.asset(
                        'assets/images/from_eaglelion_image.png',
                        width: screenWidth * 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
