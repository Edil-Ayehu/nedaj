import 'package:nedaj/export.dart';

class PhoneVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationScreen({super.key, required this.phoneNumber});

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_updateButtonState);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.removeListener(_updateButtonState);
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Phone Verification',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(56),
                Text(
                  'Verify your phone number',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                ),
                Gap(8),
                Text(
                  'We sent you a confirmation code to',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+251 - ${widget.phoneNumber}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 21,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle change phone number
                      },
                      child: Text(
                        'Change',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Constants.primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) => SizedBox(
                      width: 65,
                      height: 65,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                          hintText: '-',
                          hintStyle: TextStyle(color: Colors.green),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constants.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constants.primaryColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 4) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle resend SMS code
                    },
                    child: Text(
                      'Resend SMS Code',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Constants.primaryColor,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text(
                    'The OTP code will be expired in 2.0 min',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isButtonActive
                  ? () {
                      // Handle continue button press
                      Get.to(() => Home());
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
                disabledBackgroundColor: Colors.grey.shade400,
                disabledForegroundColor: Colors.grey.shade800,
                foregroundColor: Colors
                    .white, // This will be the color when the button is disabled
              ),
              child: Text('Continue'),
            ),
          ),
        ),
      ),
    );
  }
}
