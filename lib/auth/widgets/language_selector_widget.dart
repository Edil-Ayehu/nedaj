import 'package:nedaj/export.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({super.key});

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLanguageSelectionBottomSheet(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.green),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, color: Colors.green, size: 20),
            SizedBox(width: 8),
            Text(
              'English', // Replace with actual language name
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, color: Colors.green, size: 26),
          ],
        ),
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
