import 'dart:async';
import 'package:nedaj/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer and navigate to the home screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Lottie.asset(
                'assets/animations/fuel_anim.json',
                width: size.width * 0.7,
                height: size.height * 0.3,
                fit: BoxFit.fill,
              ),
              Text(
                'N E D A J',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.8,
                      color: Colors.grey.shade800,
                    ),
              ),
              Spacer(),
              Text(
                'from',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'EAGLELION',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 45,
                    ),
              ),
              Text(
                'System Technology',
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(20),
            ],
          ),
        ));
  }
}
