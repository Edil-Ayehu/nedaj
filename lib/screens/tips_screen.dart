import 'package:nedaj/export.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tips'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Tips'),
      ),
    );
  }
}
