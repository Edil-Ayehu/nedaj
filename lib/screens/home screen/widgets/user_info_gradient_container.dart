import 'package:nedaj/export.dart';

class UserInfoGradientContainer extends StatelessWidget {
  UserInfoGradientContainer({
    super.key,
  });

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
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
                      borderRadius: BorderRadius.circular(120),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
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
                      ),
                    ),
                    Gap(10),
                    // User full name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Abel Tesfaye 👋',
                          textScaler: TextScaler.linear(1),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                        ),
                        Text(
                          "${'welcome'.tr},",
                          textScaler: TextScaler.linear(1),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => NotificationsScreen());
                  },
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Gap(25),
          Image.asset(
            'assets/images/home_car.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
