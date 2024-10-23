import 'package:nedaj/export.dart';

class CreatePINScreen extends StatefulWidget {
  const CreatePINScreen({super.key});

  @override
  _CreatePINScreenState createState() => _CreatePINScreenState();
}

class _CreatePINScreenState extends State<CreatePINScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPINController = TextEditingController();
  final _confirmPINController = TextEditingController();
  bool _obscureNewPIN = true;
  bool _obscureConfirmPIN = true;
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _newPINController.addListener(_updateButtonState);
    _confirmPINController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _newPINController.removeListener(_updateButtonState);
    _confirmPINController.removeListener(_updateButtonState);
    _newPINController.dispose();
    _confirmPINController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = _newPINController.text.length >= 6 &&
          _confirmPINController.text.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create PIN')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create PIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Create a new PIN for your account and confirm it.',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                  ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Create New PIN',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade900,
                                    fontSize: 19,
                                  ),
                        ),
                        Gap(4),
                        TextFormField(
                          controller: _newPINController,
                          cursorColor: Colors.grey.shade600,
                          decoration: InputDecoration(
                            hintText: '* * * * * *',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey.shade400,
                                  fontSize: 22,
                                ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureNewPIN
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey.shade600,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureNewPIN = !_obscureNewPIN;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.4),
                              ),
                            ),
                          ),
                          obscureText: _obscureNewPIN,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a PIN';
                            }
                            if (value.length < 6) {
                              return 'PIN must be at least 6 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Confirm New PIN',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade900,
                                    fontSize: 19,
                                  ),
                        ),
                        Gap(4),
                        TextFormField(
                          controller: _confirmPINController,
                          cursorColor: Colors.grey.shade600,
                          decoration: InputDecoration(
                            hintText: '* * * * * *',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey.shade400,
                                  fontSize: 22,
                                ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPIN
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey.shade600,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPIN = !_obscureConfirmPIN;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Constants.primaryColor.withOpacity(0.4),
                              ),
                            ),
                          ),
                          obscureText: _obscureConfirmPIN,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your PIN';
                            }
                            if (value.length < 6) {
                              return 'PIN must be at least 6 digits';
                            }
                            if (value != _newPINController.text) {
                              return 'PINs do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.green,
                        disabledBackgroundColor: Colors.grey.shade400,
                        disabledForegroundColor: Colors.grey.shade800,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _isButtonActive
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                // Process data
                                Get.to(() => Home());
                              }
                            }
                          : null,
                      child: Text('Set PIN'),
                    ),
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
