import 'package:nedaj/export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // Fetch transaction history from Transaction model
    final List<Transaction> transactionHistory =
        Transaction.getSampleTransactions();

    // Fetch services from Service model
    final List<Service> services = Service.getServices();

    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light, // For light icons
        statusBarBrightness: Brightness.dark, // For dark background
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return PayByQr();
              },
            ));
          },
          child: Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // gradient container at the top
              Container(
                height: 300,
                padding: EdgeInsets.only(left: 15, right: 15, top: 50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0XFF07AF47),
                      Color(0XFF00471B),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.currentPage.value = 2;
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: FancyShimmerImage(
                                  imageUrl:
                                      'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D',
                                  boxFit: BoxFit.cover,
                                  errorWidget:
                                      Icon(Icons.error, color: Colors.red),
                                  shimmerDuration: Duration(seconds: 2),
                                  shimmerBaseColor: Colors.grey[300]!,
                                  shimmerHighlightColor: Colors.white,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              Gap(10),
                              // User full name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'welcome'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    'Aschalew G Tesfa',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.to(() => NotificationsScreen());
                          },
                          icon: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    Gap(15),
                    Container(
                      height: 50,
                      width: size.width * 0.35,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Account is Linked',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 16,
                                  ),
                        ),
                      )),
                    ),
                    Gap(15),
                    Text(
                      'collected_points'.tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '532',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),

              // the second container
              Transform.translate(
                offset: Offset(0, -30),
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main Services List
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainServiceContainer(
                            title: 'Stand By',
                            description: 'Set all process before arriving',
                            icon: Icons.rocket_launch_outlined,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StandByCodePage();
                                  },
                                ),
                              );
                            },
                          ),
                          MainServiceContainer(
                            title: 'Direct Pay',
                            description: 'Pay by fuel station ID',
                            icon: Icons.payments_outlined,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DirectPayPage();
                                  },
                                ),
                              );
                            },
                          ),
                          MainServiceContainer(
                            title: 'Pay by QR',
                            description: 'Directly pay by station QR',
                            icon: Icons.qr_code_scanner,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return PayByQr();
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      Text(
                        'other_services'.tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 10),

                      // other services list
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            final service = services[index];
                            return Column(
                              children: [
                                OtherServiceContainer(
                                  icon: service.icon,
                                  title: service.title,
                                  description: service.description,
                                  onTap: service.onTap,
                                ),
                                Gap(5),
                                if (index != services.length - 1)
                                  Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                Gap(5),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'recent_history'.tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: transactionHistory.length,
                          itemBuilder: (context, index) {
                            final transaction = transactionHistory[index];
                            return Column(
                              children: [
                                TransactionContainer(
                                  transactionId: transaction.transactionId,
                                  fuelType: transaction.fuelType,
                                  amount: transaction.amount,
                                  date: transaction.date,
                                  onTap: transaction.onTap,
                                ),
                                Gap(8),
                                if (index != transactionHistory.length - 1)
                                  Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                Gap(8),
                              ],
                            );
                          },
                        ),
                      ),
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
