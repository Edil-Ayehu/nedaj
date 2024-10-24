import 'package:nedaj/export.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_otp_image.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'No Internet Connection',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              'It seems you are offline',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onRetry,
                 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                   child: Text('Try Again'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}