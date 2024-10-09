import 'package:nedaj/export.dart';

class PayByQrScanPage extends StatefulWidget {
  final String gasStationName;
  final String gasStationID;
  const PayByQrScanPage({
    super.key,
    required this.gasStationName,
    required this.gasStationID,
  });

  @override
  State<PayByQrScanPage> createState() => _PayByQrScanPageState();
}

class _PayByQrScanPageState extends State<PayByQrScanPage> {
  final TextEditingController _controller = TextEditingController();
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

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
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    } // Dispose all FocusNodes
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  void continueStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });

      if (currentStep == 1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(_focusNode); // Request focus
        });
      }
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

  void _payButtonPressed() {
    final enteredText = _controller.text;

    // Store the entered text into _enteredAmount
    setState(() {
      _enteredAmount = enteredText;
    });

    // Proceed to the next step
    continueStep();
  }

  void _continueButtonPressed() {
    // Proceed to the next step
    continueStep();
  }

  Widget controlBuilders(context, details) {
    return SizedBox(); // Return an empty SizedBox to hide default buttons
  }

  // Function to show bottom sheet for selecting a car
  void _showCarSelectionBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
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
        title: const Text('Scan QR'),
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
            buildCompletedStep(context, size),
          ],
        ),
      ),
      bottomNavigationBar: currentStep == 0
          ? CustomKeyboardWithButton(
              onTextInput: _insertText,
              onBackspace: _deleteText,
              onGenerate: _payButtonPressed,
              buttonText: 'Pay',
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
          fontSize: 13,
          color: currentStep == 0 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 0 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StationContainer(
            stationName: widget.gasStationName,
            stationID: widget.gasStationID,
            stationImageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIvBWa7TC33t0QCN0zfVogKxJHEq3qpo02Dg&s',
          ),
          Gap(80),
          Text(
            'Enter Amount',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          Gap(20),
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

  Step buildBasicInfoStep(BuildContext context) {
    return Step(
      stepStyle: StepStyle(
        color: currentStep >= 1 ? Colors.green : Colors.grey,
      ),
      title: const Text(''),
      label: Text(
        'Basic Info.',
        style: TextStyle(
          fontSize: 13,
          color: currentStep == 1 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 1 ? FontWeight.bold : FontWeight.normal,
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

  Step buildCompletedStep(BuildContext context, Size size) {
    return Step(
      stepStyle: StepStyle(
        color: currentStep >= 2 ? Colors.green : Colors.grey,
      ),
      title: const Text(''),
      label: Text(
        'Completed',
        style: TextStyle(
          fontSize: 13,
          color: currentStep == 2 ? Colors.green : Colors.grey,
          fontWeight: currentStep == 2 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(90),
          Center(
            child: Transform.scale(
              scale: 2.0,
              child: Lottie.asset(
                'assets/animations/success_anim.json',
                repeat: false,
                animate: true,
              ),
            ),
          ),
          Gap(50),
          Text(
            'You have paid successfully!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          Gap(30),
          Container(
            width: size.width * 0.7,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('FT Number: '),
                    Text(
                      '3084983',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(60),
          Text(
            'Fuel Amount',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          Gap(10),
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
}
