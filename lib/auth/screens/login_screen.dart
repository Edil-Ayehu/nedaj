import 'package:nedaj/auth/screens/signup_screen.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/logos/logo.png'),
              Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 42,
                    ),
              ),
              Gap(4),
              Text(
                'Your phone number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
              ),
              Gap(16),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
              ),
              Gap(6),
              CustomTextfield(
                hintText: '0912345678',
                prefixWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/bg_image.png',
                    width: 34,
                    height: 20,
                  ),
                ),
              ),
              Gap(24),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.off(() => Home());
                  },
                  child: Text('Login'),
                ),
              ),
              Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not Registered Yet?',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Gap(4),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => SignupScreen());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
