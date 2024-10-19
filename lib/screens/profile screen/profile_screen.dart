import 'package:nedaj/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
                title: 'profile'.tr,
                height: 100,
                trailing: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => NotificationsScreen());
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: 25,
                      color: Colors.green,
                    ), 
                  ),
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      // Profile pic and details
                      UserProfileDetails(),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, bottom: 10),
                        child: Text(
                          'Settings',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700),
                        ),
                      ),
                      // Profile Info
                      ProfilePageSecondContainer(),
                      Gap(30),

                      // logo section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Image.asset(
                          'assets/logos/eaglelion.png',
                          height: 80,
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
