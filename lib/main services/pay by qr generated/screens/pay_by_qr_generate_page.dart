import 'package:nedaj/export.dart';

class PayByQrGeneratePage extends StatefulWidget {
  const PayByQrGeneratePage({super.key});

  @override
  State<PayByQrGeneratePage> createState() => _PayByQrGeneratePageState();
}

class _PayByQrGeneratePageState extends State<PayByQrGeneratePage> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode(); // Create a FocusNode
  int currentStep = 0;

  String? _selectedFuelType; // Store selected fuel type
  String? _selectedCar; // Store the selected car value
  String _enteredAmount = ''; // Store the entered amount

  // List of car options
  final List<String> _registeredCars = ['Toyota', 'Honda', 'Tesla', 'Ford'];

  final List<String> _fuelTypes = ['Petrol', 'Diesel', 'Electric'];

  @override
  void initState() {
    super.initState();
    // Add a listener to handle focus changes
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // Unfocus when tapped on the TextField
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  void continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    }
  }

  void cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  void _deleteText() {
    final textSelection = _controller.selection;
    if (textSelection.start > 0) {
      final newText = _controller.text.replaceRange(
        textSelection.start - 1,
        textSelection.start,
        '',
      );
      _controller.value = _controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
          offset: textSelection.start - 1,
        ),
      );
    }
  }

  void _insertText(String text) {
    final textSelection = _controller.selection;

    if (textSelection.start >= 0) {
      final newText = _controller.text.replaceRange(
        textSelection.start,
        textSelection.end,
        text,
      );
      final textLength = text.length;

      _controller.value = _controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
          offset: textSelection.start + textLength,
        ),
      );
    }
  }

  String _generateQrData() {
    return 'Amount: $_enteredAmount, Car: $_selectedCar, Fuel: $_selectedFuelType';
  }

  void _generateButtonPressed() {
    final enteredText = _controller.text;

    // Store the entered text into _enteredAmount
    setState(() {
      _enteredAmount = enteredText;
    });

    // Proceed to the next step
    continueStep();
  }

  Widget controlBuilders(context, details) {
    return SizedBox(); // Return an empty SizedBox to hide default buttons
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Generate QR'),
      ),
      body: Stepper(
        elevation: 0,
        connectorColor: WidgetStatePropertyAll(Colors.green),
        type: StepperType.horizontal,
        physics: const ScrollPhysics(),
        onStepTapped: onStepTapped,
        currentStep: currentStep,
        controlsBuilder: controlBuilders, // Hide default controls

        steps: [
          // step 1
          Step(
            title: const Text(
              '',
              style: TextStyle(fontSize: 1),
            ),
            label: Text(
              'Add Amount',
              style: TextStyle(
                fontSize: 16,
                color: currentStep == 0 ? Colors.green : Colors.grey,
                fontWeight:
                    currentStep == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(120),
                Text(
                  'Enter Amount',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.25,
                      child: TextField(
                        controller: _controller,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 40,
                            ),
                        cursorColor: Colors.grey.shade700,
                        autofocus: true,
                        focusNode: _focusNode, // Assign the FocusNode
                        readOnly: true, // Make the TextField read-only
                        decoration: InputDecoration(
                          hintText: '5000',
                          hintStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.none,
                        textInputAction: TextInputAction.none,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Text(
                      'birr',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.grey,
                            fontSize: 40,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            isActive: currentStep >= 0,
            state: currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          // step 2
          Step(
            title: const Text(''),
            label: Text(
              'Basic Info.',
              style: TextStyle(
                fontSize: 16,
                color: currentStep == 1 ? Colors.green : Colors.grey,
                fontWeight:
                    currentStep == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select a car'),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: _selectedCar,
                  hint: Text(
                    'Choose your registered car',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade600,
                        width: 2,
                      ),
                    ),
                  ),
                  dropdownColor:
                      Colors.white, // Background color of dropdown items

                  items: _registeredCars.map((car) {
                    return DropdownMenuItem<String>(
                      value: car,
                      child: Text(
                        car,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCar = value;
                    });
                  },
                ),
                Gap(20),
                Text('Fuel Type'),
                Gap(15),
                DropdownButtonFormField<String>(
                  value: _selectedFuelType,
                  hint: Text(
                    'Choose a fuel type',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade600,
                        width: 2,
                      ),
                    ),
                  ),
                  items: _fuelTypes.map((fuelType) {
                    return DropdownMenuItem<String>(
                      value: fuelType,
                      child: Text(fuelType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFuelType = value;
                    });
                  },
                ),
              ],
            ),
            isActive: currentStep >= 1,
            state: currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          // step 3
          Step(
            title: const Text(''),
            label: Text(
              'QR Code',
              style: TextStyle(
                fontSize: 16,
                color: currentStep == 2 ? Colors.green : Colors.grey,
                fontWeight:
                    currentStep == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(30),
                // qr code area
                if (currentStep == 2)
                  QrImageView(
                    data: _generateQrData(),
                    size: 200.0, // Adjust the size of the QR code
                  ),

                Gap(10),
                Text(
                  'Your QR Code is Generated Successfully!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Gap(30),
                Text(
                  'Fuel Amount',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                Gap(20),
                Text(
                  _enteredAmount,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                ),
              ],
            ),
            isActive: currentStep >= 2,
            state: currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
      bottomNavigationBar: currentStep == 0
          ? CustomKeyboardWithButton(
              onTextInput: _insertText,
              onBackspace: _deleteText,
              onGenerate: _generateButtonPressed,
              buttonText: 'Generate',
            )
          : (currentStep == 1
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        buttonText: 'Back',
                        onPressed: cancelStep,
                        width: size.width * 0.45,
                        isOutlinedButton: true,
                      ),
                      CustomButton(
                        buttonText: 'Next',
                        onPressed: continueStep,
                        width: size.width * 0.45,
                      ),
                    ],
                  ),
                )
              : (currentStep == 2
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: CustomButton(buttonText: 'Done', onPressed: () {}),
                    )
                  : null)),
    );
  }
}