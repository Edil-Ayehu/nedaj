import 'package:nedaj/export.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final bool centerTitle;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    required this.height,
    this.centerTitle = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15.0, top: 16),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              children: [
                centerTitle
                    ? IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                      )
                    : SizedBox.shrink(),
                centerTitle ? Spacer(flex: 2) : SizedBox.shrink(),
                Text(
                  title,
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                ),
                centerTitle ? Spacer(flex: 3) : SizedBox.shrink(),
              ],
            ),
          ),

          // trailing ?? SizedBox.shrink(),
          Expanded(
            flex: 1,
            child: trailing ?? SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
