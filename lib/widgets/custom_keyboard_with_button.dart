import 'package:nedaj/export.dart';

class CustomKeyboardWithButton extends StatelessWidget {
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onGenerate;
  final String buttonText;

  const CustomKeyboardWithButton({
    super.key,
    required this.onTextInput,
    required this.onBackspace,
    required this.onGenerate,
    required this.buttonText,
  });

  void _textInputHandler(String text) {
    onTextInput.call(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      padding: EdgeInsets.only(right: 10, top: 10, bottom: 8),
      child: Row(
        children: [
          // Number pad section
          Flexible(
            flex: 2,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  _buildKeyboardRow(['1', '2', '3']),
                  Gap(3),
                  _buildKeyboardRow(['4', '5', '6']),
                  Gap(3),
                  _buildKeyboardRow(['7', '8', '9']),
                  Gap(3),
                  _buildKeyboardRow(['-', '0', 'backspace']),
                ],
              ),
            ),
          ),
          // button section
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ElevatedButton(
                onPressed: onGenerate,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    buttonText,
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> values) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((value) {
          return value == 'backspace'
              ? _buildBackspaceButton() // Backspace icon
              : _buildKeyboardButton(value);
        }).toList(),
      ),
    );
  }

  Widget _buildKeyboardButton(String label) {
    return ElevatedButton(
      onPressed: () => _textInputHandler(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          label,
          textScaler: TextScaler.linear(1),
          style: const TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return ElevatedButton(
      onPressed: onBackspace,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ), // Consistent shape
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: const Icon(Icons.backspace, color: Colors.black),
      ),
    );
  }
}
