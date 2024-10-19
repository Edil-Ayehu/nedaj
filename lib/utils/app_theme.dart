import 'package:google_fonts/google_fonts.dart';
import 'package:nedaj/export.dart';

class AppTheme {
  // Define the theme data
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.w300,
        fontSize: 24,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 32,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 24,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black54,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 18,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 14,
        color: Colors.black54,
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
        textStyle: GoogleFonts.roboto(fontSize: 18),
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
