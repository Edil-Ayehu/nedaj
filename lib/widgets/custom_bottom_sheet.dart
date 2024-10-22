import 'package:nedaj/export.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize
              .min, // Ensure the column takes only the necessary space
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 35,
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ],
    );
  }
}
