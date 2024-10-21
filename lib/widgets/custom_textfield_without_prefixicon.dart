import 'package:nedaj/export.dart';

class CustomTextfieldWithoutPrefixIcon extends StatelessWidget {
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final double? hintFontSize;

  const CustomTextfieldWithoutPrefixIcon({
    super.key,
    required this.hintText,
    this.fillColor,
    this.borderColor,
    this.hintFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: hintFontSize ?? 18,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: hintFontSize ?? 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey.shade100, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey.shade300, width: 1),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white70,
      ),
    );
  }
}
