import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:nedaj/auth/screens/login_screen.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/screens/webview_widget.dart';

class ProfilePageSecondContainer extends StatelessWidget {
  ProfilePageSecondContainer({super.key});

  final LanguageController languageController = Get.find<LanguageController>();
  final HomeController homeController = Get.find<HomeController>();

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
            onTap: () {
              // Get.to(() => LoginScreen());
              Navigator.of(context)
                  .pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false)
                  .then((value) {
                homeController.currentPage.value = 0;
              });
            },
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 16),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'select_language'.tr,
                        textScaler: TextScaler.linear(1),
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 22,
                                ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                _buildLanguageTile(context, 'English', 'en', 'US'),
                Gap(5),
                _buildLanguageTile(context, 'አማርኛ', 'am', 'ET'),
                Gap(5),
                _buildLanguageTile(context, 'Afaan Oromoo', 'or', 'ET'),
                Gap(5),
                _buildLanguageTile(context, 'ትግርኛ', 'ti', 'ET'),
                Gap(5),
                _buildLanguageTile(context, 'Soomaali', 'so', 'SO'),
                Gap(10),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _buildLanguageTile(BuildContext context, String language,
      String langCode, String countryCode) {
    bool isSelected = languageController.selectedLanguage.value == langCode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: Color(0xff131C66), width: 1)
              : null,
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Color(0xff131C66) : Colors.white,
              border: Border.all(color: Colors.grey.shade500, width: 1),
            ),
            child: isSelected
                ? Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
          title: Text(
            language,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isSelected ? Colors.black : Colors.grey.shade500,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal,
                  fontSize: 18,
                ),
            textScaler: TextScaler.linear(1),
          ),
          onTap: () {
            languageController.changeLanguage(langCode, countryCode);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
