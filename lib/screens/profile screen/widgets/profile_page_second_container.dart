import 'package:flutter/cupertino.dart';
import 'package:nedaj/export.dart';

class ProfilePageSecondContainer extends StatelessWidget {
  ProfilePageSecondContainer({super.key});

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
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
            icon: CupertinoIcons.car_detailed,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: MyCarsPage(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          ProfileInfoContainer(
            text: 'notifications'.tr,
            icon: Icons.notification_add,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: NotificationsScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          ProfileInfoContainer(
            text: 'change_pin'.tr,
            icon: Icons.password,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: ChangePinScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          ProfileInfoContainer(
            text: 'terms_conditions'.tr,
            icon: Icons.password,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: TermsAndConditionsScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          ProfileInfoContainer(
            text: 'language'.tr,
            icon: Icons.language,
            onTap: () {
              showLanguageSelectionBottomSheet(context);
            },
          ),
          ProfileInfoContainer(
            text: 'unlink_phone'.tr,
            icon: Icons.password,
            onTap: () {},
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
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Obx(() {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 35,
                      margin: EdgeInsets.only(top: 20, bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'select_language'.tr,
                        textScaler: TextScaler.linear(1),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 24,
                            ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Divider(
                  color: Colors.grey.shade400,
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      textScaler: TextScaler.linear(1),
                    ),
                    trailing: languageController.selectedLanguage.value == 'en'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      languageController.changeLanguage('en', 'US');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Amharic',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      textScaler: TextScaler.linear(1),
                    ),
                    trailing: languageController.selectedLanguage.value == 'am'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      languageController.changeLanguage('am', 'ET');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Afaan Oromoo',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      textScaler: TextScaler.linear(1),
                    ),
                    trailing: languageController.selectedLanguage.value == 'or'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      languageController.changeLanguage('or', 'ET');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Tigrigna',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      textScaler: TextScaler.linear(1),
                    ),
                    trailing: languageController.selectedLanguage.value == 'ti'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      languageController.changeLanguage('ti', 'ET');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Soomaali',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      textScaler: TextScaler.linear(1.1),
                    ),
                    trailing: languageController.selectedLanguage.value == 'so'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      languageController.changeLanguage('so', 'SO');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(10),
              ],
            ),
          );
        });
      },
    );
  }
}