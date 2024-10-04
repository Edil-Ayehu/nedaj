import 'package:nedaj/export.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final bool isOutlinedButton;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.width = double.infinity,
    this.isOutlinedButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.green, width: isOutlinedButton ? 1 : 0),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlinedButton ? Colors.white : Colors.green,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: isOutlinedButton ? Colors.black54 : Colors.white),
        ),
      ),
    );
  }
}
