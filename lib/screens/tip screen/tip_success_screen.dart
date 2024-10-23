import 'package:nedaj/export.dart';

class TipSuccessScreen extends StatelessWidget {
  final double tipAmount;

  const TipSuccessScreen({super.key, required this.tipAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/success_image.png', // Make sure you have this image in your assets
              width: 200,
              height: 200,
            ),
            SizedBox(height: 24),
            Text(
              'Tip amount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8),
            Text(
              '\$${tipAmount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              'Your tip is successfully sent',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Back'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
