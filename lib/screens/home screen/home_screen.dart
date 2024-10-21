import 'package:nedaj/export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final HomeController homeController = Get.find<HomeController>();
  final List<Transaction> transactionHistory =
      Transaction.getSampleTransactions();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For light icons
        statusBarBrightness: Brightness.dark, // For dark background
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true, // Extend body behind app bar
        body: SingleChildScrollView(
          child: Column(
            children: [
              // gradient container at the top
              UserInfoGradientContainer(),

              // the second container
              Transform.translate(
                offset: Offset(0, -24),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main Services List
                      MainServicesContainer(),

                      SizedBox(height: 14),
                      Text(
                        'other_services'.tr,
                        textScaler: TextScaler.linear(1),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(height: 10),

                      // other services list
                      OtherServicesListContainer(),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'recent_history'.tr,
                            textScaler: TextScaler.linear(1),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                          ),
                          if (transactionHistory.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                homeController.currentPage.value = 1;
                              },
                              child: Text(
                                'See All',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.green,
                                    ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RecentHistoryListContainer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
