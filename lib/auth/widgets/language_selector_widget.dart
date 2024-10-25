import 'package:nedaj/export.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({super.key});

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String languageName =
          _getLanguageName(languageController.selectedLanguage.value);
      return PopupMenuButton<String>(
        offset: Offset(0, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
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
                languageName,
                textScaler: TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.green,
                      fontSize: 16,
                    ),
              ),
              SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down, color: Colors.green, size: 26),
            ],
          ),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          _buildPopupMenuItem('en', 'English', context),
          _buildPopupMenuItem('am', 'አማርኛ', context),
          _buildPopupMenuItem('or', 'Afaan Oromoo', context),
          _buildPopupMenuItem('ti', 'ትግርኛ', context),
          _buildPopupMenuItem('so', 'Soomaali', context),
        ],
        onSelected: (String value) {
          languageController.changeLanguage(value, _getCountryCode(value));
        },
      );
    });
  }

  PopupMenuItem<String> _buildPopupMenuItem(
      String value, String text, BuildContext context) {
    return PopupMenuItem<String>(
      value: value,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                  ),
            ),
            if (value == languageController.selectedLanguage.value)
              Icon(Icons.check, color: Colors.green),
          ],
        ),
      ),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'am':
        return 'አማርኛ';
      case 'or':
        return 'Afaan Oromoo';
      case 'ti':
        return 'ትግርኛ';
      case 'so':
        return 'Soomaali';
      default:
        return 'English';
    }
  }

  String _getCountryCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'US';
      case 'am':
        return 'ET';
      case 'or':
        return 'ET';
      case 'ti':
        return 'ET';
      case 'so':
        return 'SO';
      default:
        return 'US';
    }
  }
}
