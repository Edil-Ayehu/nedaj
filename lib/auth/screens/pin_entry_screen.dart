import 'package:nedaj/auth/screens/forgot_pin_screen.dart';
import 'package:nedaj/export.dart';

class PinEntryScreen extends StatefulWidget {
  const PinEntryScreen({super.key});

  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _checkPinAndNavigate() {
    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      // All fields are filled, navigate to Home page
      Get.off(() => Home());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
                Align(
                  alignment: Alignment.topRight,
                  child: LanguageSelector(),
                ),
                SizedBox(height: 40),
                Image.asset('assets/images/nedaj_lgo.png',
                    height: 150), // Replace with your image
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 34,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your PIN and sign in to your Nedaj account.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: 40),
                // PIN entry
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) => SizedBox(
                      width: 60,
                      height: 60,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.grey.shade600,
                        textInputAction: index < 4
                            ? TextInputAction.next
                            : TextInputAction.done,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Constants.primaryColor,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: '-',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.5),
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.3),
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.7),
                                width: 1),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 4) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          }
                        },
                        onSubmitted: (value) {
                          if (index < 4) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          } else {
                            _checkPinAndNavigate();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Icon(Icons.fingerprint, size: 90, color: Colors.green),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPinScreen());
                  },
                  child: Text(
                    'Forgot PIN?',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Constants.primaryColor,
                          fontSize: 22,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
