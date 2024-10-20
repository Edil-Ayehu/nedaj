import 'package:nedaj/auth/screens/signup_screen.dart';
import 'package:nedaj/auth/widgets/language_selector_widget.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/utils/constants.dart';
import 'package:nedaj/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
         resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                Align(
                  alignment: Alignment.topRight,
                  child: LanguageSelector(),
                ),
                Center(
                  child: Image.asset(
                    'assets/logos/logo.png',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 38,
                      ),
                ),
                Gap(4),
                Text(
                  'Use your phone number to login to your Nedaj Account.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                ),
                Gap(16),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                ),
                Gap(6),
                CustomTextfield(
                  hintText: '- 912345678',
                  hintFontSize: 18,
                  fillColor: Colors.green.withOpacity(0.05),
                  borderColor: Colors.green.shade100,
                  prefixWidget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/country_flag.png',
                          width: 30,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '+251',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.primaryColor,
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
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
