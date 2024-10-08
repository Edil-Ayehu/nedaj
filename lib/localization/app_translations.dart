import 'package:nedaj/export.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'am_ET': amET,
        'or_ET': orET,
        'ti_ET': tiET, 
        'so_ET': soET,
      };
}
