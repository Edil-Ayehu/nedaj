import 'package:nedaj/export.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transaction Details'), 
        centerTitle: true,
      ),
      body: Center(
        child: Text('Transaction Details'),
      ),
    );
  }
}
