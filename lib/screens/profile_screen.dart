import 'package:nedaj/export.dart';

class ProfileScreen extends StatelessWidget {
  final LanguageController languageController = Get.find<LanguageController>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Gap(10),
            // Profile pic and details
            buildProfileDetails(context),
            Gap(10),
            // Profile Info
            buildProfileInfo(context),
          ],
        ),
      ),
    );
  }

  Widget buildProfileDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.green),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D'),
                ),
              ),
              Positioned(
                right: 0,
                top: 4,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.green),
                  ),
                  child: Icon(Icons.photo_camera, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text('Full Name', style: Theme.of(context).textTheme.bodyLarge),
          Text('+251 - 912345676'),
        ],
      ),
    );
  }

  Widget buildProfileInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ProfileInfoContainer(
            text: 'my_cars'.tr,
            icon: Icons.notification_add,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyCarsPage();
                  },
                ),
              );
            },
          ),
          ProfileInfoContainer(
            text: 'notifications'.tr,
            icon: Icons.notification_add,
            onTap: () {},
          ),
          ProfileInfoContainer(
            text: 'change_pin'.tr,
            icon: Icons.notification_add,
            onTap: () {},
          ),
          ProfileInfoContainer(
            text: 'language'.tr,
            icon: Icons.language,
            onTap: () {
              showLanguageSelectionBottomSheet(context);
            },
          ),
          ProfileInfoContainer(
            text: 'logout'.tr,
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void showLanguageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Obx(() {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('select_language'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                ListTile(
                  title: Text('English'),
                  trailing: languageController.selectedLanguage.value == 'en'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('en', 'US');
                  },
                ),
                ListTile(
                  title: Text('Amharic'),
                  trailing: languageController.selectedLanguage.value == 'am'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('am', 'ET');
                  },
                ),
                ListTile(
                  title: Text('Afaan Oromoo'),
                  trailing: languageController.selectedLanguage.value == 'or'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('or', 'ET');
                  },
                ),
                ListTile(
                  title: Text('Tigrigna'),
                  trailing: languageController.selectedLanguage.value == 'ti'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('ti', 'ET');
                  },
                ),
                ListTile(
                  title: Text('Soomaali'),
                  trailing: languageController.selectedLanguage.value == 'so'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('so', 'SO');
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
