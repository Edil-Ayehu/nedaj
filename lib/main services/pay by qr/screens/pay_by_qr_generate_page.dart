import 'package:nedaj/export.dart';

class PayByQrGeneratePage extends StatefulWidget {
  const PayByQrGeneratePage({super.key});

  @override
  State<PayByQrGeneratePage> createState() => _PayByQrGeneratePageState();
}

class _PayByQrGeneratePageState extends State<PayByQrGeneratePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode
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

  // Function to show bottom sheet for selecting a car
  void _showCarSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: _registeredCars.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_registeredCars[index]),
              onTap: () {
                setState(() {
                  _selectedCar = _registeredCars[index];
                });
                Navigator.pop(context); // Close the bottom sheet
              },
            );
          },
        );
      },
    );
  }

  // Function to show bottom sheet for selecting a fuel type
  void _showFuelTypeSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: _fuelTypes.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_fuelTypes[index]),
              onTap: () {
                setState(() {
                  _selectedFuelType = _fuelTypes[index];
                });
                Navigator.pop(context); // Close the bottom sheet
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Generate QR'),
      ),
      body: Theme(
        data: ThemeData(
          canvasColor: Colors.white,
        ),
        child: Stepper(
          elevation: 0,
          connectorColor: WidgetStatePropertyAll(Colors.green),
          type: StepperType.horizontal,
          physics: const ScrollPhysics(),
          onStepTapped: onStepTapped,
          currentStep: currentStep,
          controlsBuilder: controlBuilders, // Hide default controls

          steps: [
            // step 1
            buildAddAmountStep(context, size),
            // step 2
            buildBasicInfoStep(context),
            // step 3
            buildQrCodeStep(context),
          ],
        ),
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
                  child: CustomButton(
                    buttonText: 'Next',
                    onPressed: continueStep,
                    width: size.width * 0.45,
                  ),
                )
              : (currentStep == 2
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: CustomButton(
                          buttonText: 'Done',
                          onPressed: () {
                            Get.off(() => Home());
                          }),
                    )
                  : null)),
    );
  }
  // step 3
  Step buildQrCodeStep(BuildContext context) {
    return Step(
      stepStyle:
          StepStyle(color: currentStep >= 2 ? Colors.green : Colors.grey),
      title: const Text(''),
      label: Text(
        'QR Code',
        style: TextStyle(
          fontSize: 14,
          color: currentStep == 2 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 0 ? FontWeight.bold : FontWeight.normal,
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
              version: QrVersions.auto,
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
            '$_enteredAmount Birr',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
          ),
        ],
      ),
      isActive: currentStep >= 2,
      state: currentStep >= 2 ? StepState.complete : StepState.disabled,
    );
  }

  // step 2
  Step buildBasicInfoStep(BuildContext context) {
    return Step(
      stepStyle:
          StepStyle(color: currentStep >= 1 ? Colors.green : Colors.grey),
      title: const Text(''),
      label: Text(
        'Basic Info.',
        style: TextStyle(
          fontSize: 14,
          color: currentStep == 1 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 0 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select a car'),
          Gap(15),
          TextField(
            readOnly: true,
            controller: TextEditingController(text: _selectedCar),
            decoration: InputDecoration(
              hintText: 'Choose your registered car',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              border: Theme.of(context).inputDecorationTheme.border,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
            ),
            onTap: _showCarSelectionBottomSheet,
          ),
          Gap(20),
          Text('Fuel Type'),
          Gap(15),
          TextField(
            readOnly: true,
            controller: TextEditingController(text: _selectedFuelType),
            decoration: InputDecoration(
              hintText: 'Choose a fuel type',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              border: Theme.of(context).inputDecorationTheme.border,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
            ),
            onTap: _showFuelTypeSelectionBottomSheet,
          ),
        ],
      ),
      isActive: currentStep >= 1,
      state: currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }
  
  // step 1
  Step buildAddAmountStep(BuildContext context, Size size) {
    return Step(
      stepStyle: StepStyle(
        color: currentStep >= 0 ? Colors.green : Colors.grey,
      ),
      title: const Text(
        '',
        style: TextStyle(fontSize: 1),
      ),
      label: Text(
        'Add Amount',
        style: TextStyle(
          fontSize: 14,
          color: currentStep == 0 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 0 ? FontWeight.bold : FontWeight.normal,
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
          SizedBox(
            width: size.width * 0.8,
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
                hintText: '0 Birr',
                contentPadding: EdgeInsets.only(left: 50),
                suffixText: 'Birr',
                suffixStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 40,
                    ),
                hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey,
                      fontSize: 40,
                    ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              keyboardType: TextInputType.none,
              textInputAction: TextInputAction.none,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      isActive: currentStep >= 0,
      state: currentStep >= 0 ? StepState.complete : StepState.disabled,
    );
  }
}
