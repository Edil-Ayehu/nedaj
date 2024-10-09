import 'package:nedaj/export.dart';

class AppTheme {
  // Define the theme data
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.w300,
        fontSize: 24,
        fontFamily: 'Lato',
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: Colors.black54,
        fontFamily: 'Lato',
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black54,
        fontFamily: 'Lato',
      ),
    ),

    // floatingActionButto Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        textStyle: TextStyle(fontSize: 18),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade600,
          width: 1,
        ),
      ),
    ),
  );
}
