import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/screens/webview_widget.dart';

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
            text: 'change_pin'.tr,
            icon: FluentIcons.lock_closed_24_regular,
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
            text: 'language'.tr,
            icon: FluentIcons.globe_24_regular,
            onTap: () {
              showLanguageSelectionBottomSheet(context);
            },
          ),
          ProfileInfoContainer(
            text: 'Privacy Policy',
            icon: FluentIcons.shield_24_regular,
            onTap: () {
              Get.to(() => WebviewWidget(
                    url: 'https://www.eaglelionsystems.com/',
                    title: 'Privacy Policy',
                  ));
            },
          ),
          ProfileInfoContainer(
            text: 'terms_conditions'.tr,
            icon: FluentIcons.document_24_regular,
            onTap: () {
              Get.to(() => WebviewWidget(
                    url: 'https://www.eaglelionsystems.com/',
                    title: 'Terms and Conditions',
                  ));
            },
          ),
          ProfileInfoContainer(
            text: 'About Nedaj',
            icon: FluentIcons.info_24_regular,
            onTap: () {
              Get.to(() => WebviewWidget(
                    url: 'https://www.eaglelionsystems.com/',
                    title: 'About Nedaj',
                  ));
            },
          ),
          ProfileInfoContainer(
            text: 'unlink_phone'.tr,
            icon: FluentIcons.phone_dismiss_24_regular,
            onTap: () {},
          ),
          ProfileInfoContainer(
            text: 'logout'.tr,
            icon: FluentIcons.sign_out_24_regular,
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
                      'አማርኛ',
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
                      'ትግርኛs',
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
