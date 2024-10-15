import 'package:nedaj/export.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final bool isOutlinedButton;
  final double borderRadius;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.width = double.infinity,
    this.isOutlinedButton = false,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.green, width: isOutlinedButton ? 1 : 0),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlinedButton ? Colors.white : Colors.green,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textScaler: TextScaler.linear(1),
          style: TextStyle(
              color: isOutlinedButton ? Colors.black54 : Colors.white),
        ),
      ),
    );
  }
}
