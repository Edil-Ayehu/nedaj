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
      padding: EdgeInsets.only(
          left: 15, right: 15, top: MediaQuery.of(context).padding.top + 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0XFF07AF47),
            Color(0XFF00471B),
          ],
        ),

        // background image
        image: DecorationImage(
          image: AssetImage('assets/images/gradient_bg_image.png'),
          fit: BoxFit.cover,
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
                                    fontSize: 18,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              NotificationIconContainer(),
            ],
          ),
          Gap(25),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.13),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nedaj',
                              textScaler: TextScaler.linear(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Fuel up fast with Nedaj—pay for your fuel securely & conveniently, anytime, anywhere!',
                              textScaler: TextScaler.linear(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Image.asset(
                          'assets/images/fuel_image.png',
                          fit: BoxFit.cover,
                          // width: 75,
                          // height: 75,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/large_car_image.png',
                    fit: BoxFit.cover,
                    height: 117,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
