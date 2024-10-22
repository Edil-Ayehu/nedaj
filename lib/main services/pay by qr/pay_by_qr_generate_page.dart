import 'package:nedaj/export.dart';

class PayByQrGeneratePage extends StatefulWidget {
  const PayByQrGeneratePage({super.key});

  @override
  State<PayByQrGeneratePage> createState() => _PayByQrGeneratePageState();
}

class _PayByQrGeneratePageState extends State<PayByQrGeneratePage> {
  bool _showQrGeneratedWidget = false;
  String _car = '';
  String _fuelType = '';
  String _amount = '';

  final FocusNode _focusNode = FocusNode(); // Create a FocusNode

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
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  void _onFormSubmit(String car, String fuelType, String amount) {
    setState(() {
      _showQrGeneratedWidget = true;
      _car = car;
      _fuelType = fuelType;
      _amount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MainServicesCustomAppBar(title: 'Pay by QR'),
            Expanded(
              child: _showQrGeneratedWidget
                  ? QrGeneratedWidget(
                      car: _car,
                      fuelType: _fuelType,
                      amount: _amount,
                      customerName: 'Abel Tesfaye Girma',
                    )
                  : FormWidget(onFormSubmit: _onFormSubmit),
            ),
          ],
        ),
      ),
    );
  }
}
