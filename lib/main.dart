import 'package:nedaj/export.dart';
import 'package:nedaj/widgets/connectivity_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the onboarding should be shown
   SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showOnboarding = prefs.getBool('showOnboarding') ?? true;

  // Get the application documents directory
  final appDocumentDir = await getApplicationDocumentsDirectory();

  // Initialize Hive with the app documents directory 
  await Hive.initFlutter(appDocumentDir.path);

  // Open a Hive box to store the selected language
  await Hive.openBox('settingsBox');
  
  // dependencies 
  Get.put(LanguageController());
  Get.put(HomeController());

  runApp(MyApp(showOnboarding: showOnboarding));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp({super.key, required this.showOnboarding});

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
      home: showOnboarding ? ConnectivityWrapper(child: OnboardingScreen()) : ConnectivityWrapper(child: SplashScreen()),
       
    );
  }
} 
