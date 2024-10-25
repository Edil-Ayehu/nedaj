import 'package:nedaj/export.dart';

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
          // Change Pin
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
          // Language
          ProfileInfoContainer(
            text: 'language'.tr,
            icon: FluentIcons.globe_24_regular,
            onTap: () {
              showLanguageSelectionBottomSheet(context);
            },
          ),
          // Privacy Policy
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
          // Terms and Conditions
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
          // About Nedaj
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
          // Unlink Device
          ProfileInfoContainer(
            text: 'unlink_phone'.tr,
            icon: FluentIcons.phone_dismiss_24_regular,
            onTap: () {
              _showCustomDialog(
                context,
                'assets/images/unlink_dialog_image.png',
                'Unlink Device',
                'Are you sure you want to unlink your account from this device?',
                'Cancel',
                'Unlink',
                () {
                  // Add unlink phone logic here
                },
              );
            },
          ),
          // Logout
          ProfileInfoContainer(
            text: 'logout'.tr,
            icon: FluentIcons.sign_out_24_regular,
            onTap: () {
              // _showLogoutDialog(context);
              _showCustomDialog(
                context,
                'assets/images/logout_dialog_image.png',
                'Log out',
                'Are you sure you want to logout?',
                'Cancel',
                'Logout',
                () {
                  // Close the dialog
                  Navigator.of(context).pop();

                  // Navigate to LoginScreen and remove all previous routes
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);

                  // Reset the current page after navigation
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    homeController.currentPage.value = 0;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(
    BuildContext context,
    String imagePath,
    String title,
    String message,
    String cancelButtonText,
    String actionButtonText,
    VoidCallback onActionPressed,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        imagePath,
                        height: 40,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 24,
                                ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Constants.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(cancelButtonText,
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(actionButtonText),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              onActionPressed();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
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
                      padding: const EdgeInsets.only(right: 16.0, top: 10),
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
              ? Border.all(color: Color(0xff131C66).withOpacity(0.5), width: 1)
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
