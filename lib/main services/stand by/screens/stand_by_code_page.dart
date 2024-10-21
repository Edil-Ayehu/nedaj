import 'package:nedaj/export.dart';
import 'package:nedaj/utils/constants.dart';

class StandByCodePage extends StatefulWidget {
  const StandByCodePage({super.key});

  @override
  State<StandByCodePage> createState() => _StandByCodePageState();
}

class _StandByCodePageState extends State<StandByCodePage> {
  bool _showCodeGeneratedWidget = false;
  String _generatedCode = '';
  String _car = '';
  String _fuelType = '';
  String _amount = '';

  void _onFormSubmit(String car, String fuelType, String amount) {
    setState(() {
      _showCodeGeneratedWidget = true;
      _car = car;
      _fuelType = fuelType;
      _amount = amount;
      _generatedCode =
          _generateCode(); // Implement this method to generate a code
    });
  }

  String _generateCode() {
    // Implement your code generation logic here
    return '123456'; // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom appbar
              Container(
                height: size.height * 0.1,
                width: size.width,
                padding: EdgeInsets.only(top: 20, bottom: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Stand by Payment',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 22,
                              ),
                    ),
                  ],
                ),
              ),

              _showCodeGeneratedWidget
                  ? CodeGeneratedWidget(
                      code: _generatedCode,
                      car: _car,
                      fuelType: _fuelType,
                      amount: _amount,
                    )
                  : FormWidget(onFormSubmit: _onFormSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeGeneratedWidget extends StatelessWidget {
  final String code;
  final String car;
  final String fuelType;
  final String amount;

  const CodeGeneratedWidget({
    super.key,
    required this.code,
    required this.car,
    required this.fuelType,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(45),
          Image.asset(
            'assets/images/success_image.png',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          Gap(20),
          Center(
            child: Text(
              'Stand by Code generated Successfully!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
            ),
          ),
          Gap(20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            child: Column(
              children: [
                Text(
                  'Your Payment Code',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                Gap(10),
                Text(
                  code,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color(0xff16553A),
                      ),
                ),
              ],
            ),
          ),
          Gap(20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade100, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Details:',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer Name:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                    ),
                    Text(
                      'Abel Tesfaye Girma',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                              ),
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Car:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                    ),
                    Text(
                      car,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                              ),
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fuel Type:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                    ),
                    Text(
                      fuelType,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                              ),
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                    ),
                    Text(
                      amount,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 19,
                              ),
                    ),
                  ],
                ),
              ],
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
                  Get.back();
                },
                child: Text(
                  'Done',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                )),
          ),
          Gap(24),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  final Function(String car, String fuelType, String amount) onFormSubmit;
  const FormWidget({super.key, required this.onFormSubmit});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String? _selectedFuelType; // Store selected fuel type
  String? _selectedCar; // Store the selected car value

  final TextEditingController _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode

  @override
  void initState() {
    super.initState();
    // Add a listener to handle focus changes
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  bool _areAllFieldsFilled() {
    return _selectedCar != null &&
        _selectedFuelType != null &&
        _amountController.text.isNotEmpty;
  }

  void _onContinuePressed() {
    widget.onFormSubmit(
        _selectedCar!, _selectedFuelType!, _amountController.text);
  }

  // List of car options
  final List<String> _registeredCars = ['Toyota', 'Honda', 'Tesla', 'Ford'];

  final List<String> _fuelTypes = ['Petrol', 'Diesel', 'Electric'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10),
          Text(
            'Make Fuel Payment',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 26,
                ),
          ),
          Text(
            'Get your Nedaj stand by code ready to pay instantly at your nearest fuel station.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                ),
          ),
          Gap(22),
          Text('Select Car'),
          Gap(7),
          TextFormField(
            readOnly: true,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            controller: TextEditingController(text: _selectedCar),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              hintText: 'Select Car',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade200, width: 1),
              ),
            ),
            onTap: () => _showCarSelectionBottomSheet(),
          ),
          Gap(15),
          Text('Select Fuel Type'),
          Gap(7),
          TextFormField(
            readOnly: true,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            controller: TextEditingController(text: _selectedFuelType),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              hintText: 'Fuel Type',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade200, width: 1),
              ),
            ),
            onTap: () => _showFuelTypeSelectionBottomSheet(),
          ),
          Gap(15),
          Text('Enter Amount'),
          Gap(7),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 18,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              hintText: 'Enter Amount',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade50, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.green.shade200, width: 1),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return Colors.grey.shade500;
                    }
                    return Constants.primaryColor;
                  },
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: _areAllFieldsFilled() ? _onContinuePressed : null,
              child: Text(
                'Continue',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          Gap(24),
        ],
      ),
    );
  }

  // Function to show bottom sheet for selecting a car
  void _showCarSelectionBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // This allows better control over the size
      builder: (context) {
        return CustomBottomSheet(
          title: 'Select a car',
          child: ListView.builder(
            itemCount: _registeredCars.length,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Prevent scrolling in the list
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
          ),
        );
      },
    );
  }

  // Function to show bottom sheet for selecting a fuel type
  void _showFuelTypeSelectionBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // This allows better control over the size
      builder: (context) {
        return CustomBottomSheet(
          title: 'Select fuel type',
          child: ListView.builder(
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
          ),
        );
      },
    );
  }
}
