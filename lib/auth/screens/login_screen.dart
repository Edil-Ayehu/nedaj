import 'package:nedaj/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
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
                Spacer(),
                Center(
                  child: Image.asset(
                    'assets/images/nedaj_lgo.png',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(26),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 38,
                      ),
                ),
                Text(
                  'Use your phone number to login to your Nedaj Account.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                ),
                Gap(20),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                ),
                Gap(6),
                TextFormField(
                  validator: Validators.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  maxLength: 9,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.05),
                    hintText: '912345678',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green.shade100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green.shade100),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/country_flag.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 28,
                          ),
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
                        Get.to(() => SignupScreen());
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
