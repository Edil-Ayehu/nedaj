import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(title: Text('Phone Verification')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify your phone number',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Text('We sent you a confirmation code to'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle change phone number
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(decoration: TextDecoration.underline),
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
                      width: 50,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                          hintText: '-',
                          hintStyle: TextStyle(color: Colors.green),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
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
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'The OTP code will be expired in 20 min',
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
