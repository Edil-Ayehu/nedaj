import 'package:nedaj/export.dart';
import 'package:nedaj/utils/constants.dart';

class FormWidget extends StatefulWidget {
  final Function(String car, String fuelType, String amount) onFormSubmit;
  const FormWidget({super.key, required this.onFormSubmit});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String? _selectedFuelType;
  String? _selectedCar;
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });
    _amountController.addListener(_updateState);
  }

  @override
  void dispose() {
    _amountController.removeListener(_updateState);
    _amountController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {});
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

  final List<String> _registeredCars = ['Toyota', 'Honda', 'Tesla', 'Ford'];
  final List<String> _fuelTypes = ['Petrol', 'Diesel', 'Electric'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
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
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade200, width: 1),
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
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade200, width: 1),
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
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade50, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.green.shade200, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey.shade500;
                    }
                    return Constants.primaryColor;
                  },
                ),
                shape: MaterialStateProperty.all(
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
        ),
      ],
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
