import 'package:nedaj/export.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainServicesCustomAppBar(title: 'Stand by Payment'),
            Expanded(
              child: _showCodeGeneratedWidget
                  ? CodeGeneratedWidget(
                      code: _generatedCode,
                      car: _car,
                      fuelType: _fuelType,
                      amount: _amount,
                    )
                  : FormWidget(onFormSubmit: _onFormSubmit),
            ),
          ],
        ),
      ),
    );
  }
}
