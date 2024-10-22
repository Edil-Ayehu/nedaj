import 'package:nedaj/export.dart';
import 'package:nedaj/utils/constants.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  bool _obscureOldPin = true;
  bool _obscureNewPin = true;
  bool _obscureConfirmPin = true;

  final TextEditingController _oldPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  bool get _isFormValid =>
      _oldPinController.text.isNotEmpty &&
      _newPinController.text.isNotEmpty &&
      _confirmPinController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _oldPinController.addListener(_updateButtonState);
    _newPinController.addListener(_updateButtonState);
    _confirmPinController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: 'Change PIN', height: 100, centerTitle: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change PIN',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.1,
                        ),
                  ),
                  Gap(2),
                  Text(
                    'Enter your previous PIN and create a new one.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                  ),
                  Gap(10),
                  _buildPinTextField('Old PIN', _obscureOldPin, () {
                    setState(() {
                      _obscureOldPin = !_obscureOldPin;
                    });
                  }, _oldPinController),
                  SizedBox(height: 20),
                  _buildPinTextField('New PIN', _obscureNewPin, () {
                    setState(() {
                      _obscureNewPin = !_obscureNewPin;
                    });
                  }, _newPinController),
                  SizedBox(height: 20),
                  _buildPinTextField('Confirm New PIN', _obscureConfirmPin, () {
                    setState(() {
                      _obscureConfirmPin = !_obscureConfirmPin;
                    });
                  }, _confirmPinController),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isFormValid
                          ? () {
                              // Implement PIN change logic here
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormValid
                            ? Constants.primaryColor
                            : Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Set PIN',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinTextField(String label, bool obscureText, VoidCallback onTap,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),
        Text(
          '$label*',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 18,
              ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: '**********',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green.shade50),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green.shade50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green.shade100, width: 1),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
