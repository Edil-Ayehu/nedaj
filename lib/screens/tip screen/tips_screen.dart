import 'package:nedaj/export.dart';
import 'package:nedaj/screens/tip%20screen/widgets/empty_tips_widget.dart';
import 'package:nedaj/screens/tip%20screen/widgets/tip_container.dart';
import 'package:nedaj/models/tip_model.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = TipModel.getTipModels();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'tips'.tr,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontSize: 22,
              ),
        ),
      ),
      body: tips.isEmpty
          ? EmptyTipsWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  Text(
                    'Tips Given',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                  ),
                  Text(
                    'List of all tips given to Nedaj attendants',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                  ),
                  Gap(20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tips.length,
                      itemBuilder: (context, index) {
                        final tip = tips[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TipContainer(
                            tipAmount: tip.tipAmount,
                            tipDate: tip.date,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Constants.primaryColor,
        onPressed: () {
          // Get.to(() => RegisterCarScreen());
        },
        label: Text('Give Tip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1.2,
            )),
        icon: Icon(Icons.add),
      ),
    );
  }
}


