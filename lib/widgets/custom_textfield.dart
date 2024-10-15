import 'package:nedaj/export.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? prefixWidget;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 16,
        ),
        prefixIcon: prefixWidget ?? SizedBox.shrink(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white70,
      ),
    );
  }
}
