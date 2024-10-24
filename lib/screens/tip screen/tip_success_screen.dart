import 'package:nedaj/export.dart';

class TipSuccessScreen extends StatelessWidget {
  final double tipAmount;

  const TipSuccessScreen({super.key, required this.tipAmount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tips',textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(size.height * 0.16),
              Image.asset(
                'assets/images/success_image.png', // Make sure you have this image in your assets
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
              Gap(30),
              Container(
                width: size.width * 0.7,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xffF0F8F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Tip amount',textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${tipAmount.toStringAsFixed(2)} Birr',textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color(0xff16553A),
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Text(
                'Your Tip is Successfully Sent',textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 22,
                    ),
              ),
              Gap(10),
              Text(
                'You haven’t registered any cars yet. Add your car now to make fuel payments faster and easier!',
                textScaler: TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => Home());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Constants.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Done',textScaler: TextScaler.linear(1),),
                ),
              ),
              Gap(22),
            ],
          ),
        ),
      ),
    );
  }
}
