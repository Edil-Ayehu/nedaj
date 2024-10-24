import 'package:nedaj/auth/screens/phone_verification_screen.dart';
import 'package:nedaj/export.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  String? _phoneError;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() {
      _phoneError = null;
    });

    if (_formKey.currentState!.validate()) {
      if (_phoneController.text.length == 9) {
        // Handle forgot PIN logic here
        // For now, we'll just print a message
        Get.to(() => PhoneVerificationScreen(
              phoneNumber: _phoneController.text,
            ));
        print('Forgot PIN for number: ${_phoneController.text}');
      } else {
        setState(() {
          _phoneError = 'Please enter a 9-digit phone number';
        });
      }
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40),
                  Align(
                    alignment: Alignment.topRight,
                    child: LanguageSelector(),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/nedaj_lgo.png',
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(36),
                  Text(
                    'Forgot PIN',textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 34,
                        ),
                  ),
                  Text(
                    'Enter your phone number to reset your PIN.',textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                  ),
                  Gap(20),
                  Text(
                    'Phone Number',textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                  ),
                  Gap(6),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
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
                      errorText: _phoneError,
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
                  Spacer(
                    flex: 3,
                  ),
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
                      onPressed: _validateAndSubmit,
                      child: Text('Continue'),
                    ),
                  ),
                  Gap(34),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
