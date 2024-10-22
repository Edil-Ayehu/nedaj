import 'package:nedaj/export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double _buttonOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _buttonOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Top image
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/logos/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right:
                          -50, // Move the image to the right and cut out a part
                      child: Image.asset(
                        'assets/images/car_image.png',
                        height: 200,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 100), // Add space for the car image
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Fuel Up, Pay Effortlessly!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Easily pay for fuel with Nedaj—fast, secure, and',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'convenient. Skip the hassle and fuel up with just a few',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'taps!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Get Started button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedOpacity(
                  opacity: _buttonOpacity,
                  duration: Duration(seconds: 1),
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('showOnboarding', false);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Get Started'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
