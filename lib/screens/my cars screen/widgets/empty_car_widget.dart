import 'package:nedaj/export.dart';

class EmptyCarWidget extends StatelessWidget {
  const EmptyCarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.88,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset('assets/images/no_registered_car_image.png'),
          Text(
            'No Registered Cars',textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(10),
          Text(
            'You haven’t registered any cars yet. Add your car now to make fuel payments faster and easier!',
            textScaler: TextScaler.linear(1),textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text('Register Car',textScaler: TextScaler.linear(1),),
            ),
          ),
        ],
      ),
    );
  }
}
