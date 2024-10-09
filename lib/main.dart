import 'package:nedaj/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get the application documents directory
  final appDocumentDir = await getApplicationDocumentsDirectory(); 

  // Initialize Hive with the app documents directory
  await Hive.initFlutter(appDocumentDir.path);

  // Open a Hive box to store the selected language
  await Hive.openBox('settingsBox');
  
  // dependencies 
  Get.put(LanguageController());
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBox = Hive.box('settingsBox');
    String? savedLanguageCode =
        settingsBox.get('languageCode', defaultValue: 'en');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(), // Translation mappings
      locale: Locale(
          savedLanguageCode!), // Load saved language or default to English
      fallbackLocale: Locale('en', 'US'), // Fallback locale in case of an error
      title: 'app_name'.tr, // Use translation
      theme: AppTheme.lightTheme,  
      home: Home(),
    );
  }
} 
