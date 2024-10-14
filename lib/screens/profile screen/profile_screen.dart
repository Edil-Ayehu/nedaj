import 'package:nedaj/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'profile'.tr, height: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    Gap(10),
                    // Profile pic and details
                    UserProfileDetails(),
                    Gap(10),
                    // Profile Info
                    ProfilePageSecondContainer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
