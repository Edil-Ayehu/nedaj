import 'package:flutter/material.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Change PIN'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Change PIN'),
      ),
    );
  }
}
