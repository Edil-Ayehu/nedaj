class OtpModel {
  final String otp;
  final DateTime date;

  OtpModel({
    required this.otp,
    required this.date,
  });

  // Factory constructor to create an OtpModel instance from a Map
  factory OtpModel.fromMap(Map<String, dynamic> data) {
    return OtpModel(
      otp: data['otp'],
      date: data['date'],
    );
  }

  // Static method to return a list of otp models
  static List<OtpModel> getOtpModels() {
    return [
      OtpModel(
        otp: '123456',
        date: DateTime(2024, 6, 13, 8, 45), // June 12, 2024 6:30 AM
      ),
      OtpModel(
        otp: '433422',
        date: DateTime(2024, 6, 13, 8, 45), // June 12, 2024 6:30 AM
      ),
      OtpModel(
        otp: '654321',
        date: DateTime.now(),
      ),
      OtpModel(
        otp: '854321',
        date: DateTime.now(),
      ),
      OtpModel(
        otp: '135790',
        date: DateTime(2024, 6, 13, 6, 45),
      ),
      OtpModel(
        otp: '246802',
        date: DateTime(2024, 6, 13, 3, 40), // June 12, 2024 6:30 AM
      ),
      OtpModel(
        otp: '135790',
        date: DateTime(2024, 8, 13, 14, 45),
      ),
      OtpModel(
        otp: '010203',
        date: DateTime(2024, 7, 13, 14, 45),
      ),
    ];
  }
}
