import 'package:nedaj/export.dart';

class EmptyTipsWidget extends StatelessWidget {
  const EmptyTipsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_tips_image.png', // Make sure this image exists in your assets
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'No Tips Given Yet',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 24,
                  ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                'You haven\'t given any tips yet. Once you do, your tip history will show up here for easy tracking!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
      );
  }
}