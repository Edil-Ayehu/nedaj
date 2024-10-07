import '../export.dart';

class LanguageController extends GetxController {
  // Observable variable for the selected language
  var selectedLanguage = 'en'.obs; 

  // Initialize the selected language from Hive
  @override
  void onInit() {
    var box = Hive.box('settingsBox');
    selectedLanguage.value = box.get('languageCode', defaultValue: 'en');
    super.onInit();
  }

  // Function to change the language and save to Hive
  void changeLanguage(String langCode, String countryCode) async {
    selectedLanguage.value = langCode;

    var locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);

    // Save language selection to Hive
    var box = Hive.box('settingsBox');
    await box.put('languageCode', langCode);
  }
}
