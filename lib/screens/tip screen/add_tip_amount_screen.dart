import 'package:nedaj/export.dart';

class AddTipAmountScreen extends StatefulWidget {
  final Transaction transaction;

  const AddTipAmountScreen({super.key, required this.transaction});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tips',
            textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            Text(
              'Add Amount',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                  ),
            ),
            Text(
              'Set your tip amount for the selected transaction and send.',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              'Add Amount',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Gap(6),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d+\.?\d{0,2}')), // Allow only numbers with up to 2 decimal places
              ],
              decoration: InputDecoration(
                hintText: 'Add Amount',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade400,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Constants.primaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Constants.primaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Constants.primaryColor.withOpacity(0.6),
                    width: 1,
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        double tipAmount =
                            double.tryParse(_amountController.text) ?? 0;
                        Get.to(() => TipSuccessScreen(tipAmount: tipAmount));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.grey.shade500,
                  backgroundColor: Constants.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Send',
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
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
