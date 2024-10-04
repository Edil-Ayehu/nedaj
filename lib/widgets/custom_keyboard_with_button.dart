import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(right: 15, top: 10, bottom: 8),
      child: Row(
        children: [
          // Number pad section
          Flexible(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  _buildKeyboardRow(['1', '2', '3']),
                  _buildKeyboardRow(['4', '5', '6']),
                  _buildKeyboardRow(['7', '8', '9']),
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
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
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
        padding: const EdgeInsets.all(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return ElevatedButton(
      onPressed: onBackspace,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(), // Consistent shape
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
      ),
      child: const Icon(Icons.backspace, color: Colors.black),
    );
  }
}
