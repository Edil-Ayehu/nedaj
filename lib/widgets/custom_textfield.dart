import 'package:nedaj/export.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? prefixWidget;
  final Color? fillColor;
  final Color? borderColor;
  final double? hintFontSize;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.prefixWidget,
    this.fillColor,
    this.borderColor,
    this.hintFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: hintFontSize ?? 16,
        ),
        prefixIcon: prefixWidget ?? SizedBox.shrink(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey.shade200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey.shade200, width: 1),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white70,
      ),
    );
  }
}
