import 'package:nedaj/export.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;
  final bool isRetrying;

  const NoInternetScreen(
      {Key? key, required this.onRetry, required this.isRetrying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(size.height * 0.3),
            Image.asset(
              'assets/images/no_internet_connection_image.png',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
            Text(
              'No Internet Connection',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 30,
                  ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                ' It seems like you’re offline. Please check your connection and try again to continue using Nedaj.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isRetrying
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Try Again'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
