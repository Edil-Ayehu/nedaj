import 'package:nedaj/export.dart';

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
  final List<String> _fuelTypes = ['Gasoline', 'Regular'];

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
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 23,
                        ),
                  ),
                  Text(
                    'Get your Nedaj stand by code ready to pay instantly at your nearest fuel station.',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                        ),
                  ),
                  Gap(22),
                  Text(
                    'Select Car',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                        ),
                  ),
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
                  Text(
                    'Select Fuel Type',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                        ),
                  ),
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
                  Text(
                    'Enter Amount',
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                        ),
                  ),
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
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: Colors.grey.shade500,
                backgroundColor: Constants.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _areAllFieldsFilled() ? _onContinuePressed : null,
              child: Text(
                'Continue',
                textScaler: TextScaler.linear(1),
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
    mainFunctionBottomSheet(
      title: 'Select Car',
      child: ListView.builder(
        itemCount: _registeredCars.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCar = _registeredCars[index];
              });
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                _registeredCars[index],
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to show bottom sheet for selecting a fuel type
  void _showFuelTypeSelectionBottomSheet() {
    mainFunctionBottomSheet(
      title: 'Fuel Type',
      child: ListView.builder(
        itemCount: _fuelTypes.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFuelType = _fuelTypes[index];
              });
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                _fuelTypes[index],
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> mainFunctionBottomSheet(
      {required String title, required Widget child}) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // This allows better control over the size
      builder: (context) {
        return Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    title,
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 22,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                child,
              ],
            ),
          ],
        );
      },
    );
  }
}
