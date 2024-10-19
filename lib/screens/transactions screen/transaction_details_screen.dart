import 'package:nedaj/export.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
            title: 'Transaction Details',
            height: 100,
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
