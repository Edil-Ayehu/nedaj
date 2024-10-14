import 'package:nedaj/export.dart';

class UserInfoGradientContainer extends StatelessWidget {
 UserInfoGradientContainer({
    super.key,
  });


  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
                        errorWidget: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                        shimmerDuration: Duration(seconds: 2),
                        shimmerBaseColor: Colors.grey[300]!,
                        shimmerHighlightColor: Colors.white,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Gap(10),
                    // User full name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome'.tr,
                          textScaler: TextScaler.linear(1),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200),
                        ),
                        Text(
                          'Aschalew G Tesfa',
                          textScaler: TextScaler.linear(1),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
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
            height: 40,
            width: size.width * 0.35,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Account is Linked',
                textScaler: TextScaler.linear(1),
                style:
                    Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        ),
              ),
            )),
          ),
          Gap(15),
          Text(
            'collected_points'.tr,
            textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
          ),
          Text(
            '532 Pt',
            textScaler: TextScaler.linear(1),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
