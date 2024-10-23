import 'package:nedaj/export.dart';
import 'package:nedaj/screens/tip%20screen/tip_success_screen.dart';

class AddTipAmountScreen extends StatefulWidget {
  final Transaction transaction;

  const AddTipAmountScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  _AddTipAmountScreenState createState() => _AddTipAmountScreenState();
}

class _AddTipAmountScreenState extends State<AddTipAmountScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _amountController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add amount'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set your tip amount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Text(
              'Add Amount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter tip amount',
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        double tipAmount = double.tryParse(_amountController.text) ?? 0;
                        Get.to(() => TipSuccessScreen(tipAmount: tipAmount));
                      }
                    : null,
                child: Text('Send'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}