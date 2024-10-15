class Validators {
  // Password validator method
  static bool isValidPassword(String password) {
    // Regular expression for validating the password
    final passwordRegex = RegExp(
      r"^(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=])(?=.{6,18}$).+$"
    );

    // Check if the password matches the regular expression
    return passwordRegex.hasMatch(password);
  }


   // email validator method
   static bool isValidEmail(String email) {
    // Regular expression for validating the email format
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }


  // Phone number validator method
  static bool isValidPhoneNumber(String phoneNumber) {
    // Regular expression for validating 9-digit phone numbers
    final phoneRegex = RegExp(r"^[0-9]{9}$");

    // Check if the phone number matches the regular expression
    return phoneRegex.hasMatch(phoneNumber);
  }
}
