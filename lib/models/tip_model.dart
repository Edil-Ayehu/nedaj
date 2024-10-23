class TipModel {
  final double tipAmount;
  final DateTime date;

  TipModel({
    required this.tipAmount,
    required this.date,
  });

  // Factory constructor to create an OtpModel instance from a Map
  factory TipModel.fromMap(Map<String, dynamic> data) {
    return TipModel(
      tipAmount: data['tip'],
      date: data['date'],
    );
  }

  // Static method to return a list of otp models
  static List<TipModel> getTipModels() {
    List<TipModel> tips = [
      // TipModel(
      //   tipAmount: 123456,
      //   date: DateTime(2024, 6, 13, 8, 45), // June 12, 2024 6:30 AM
      // ),
      // TipModel(
      //   tipAmount: 854321,
      //   date: DateTime.now(),
      // ),
      // TipModel(
      //   tipAmount: 246802,
      //   date: DateTime(2019, 6, 13, 3, 40), // June 12, 2024 6:30 AM
      // ),
      // TipModel(
      //   tipAmount: 135790,
      //   date: DateTime(2020, 8, 13, 14, 45),
      // ),
      // TipModel(
      //   tipAmount: 135790,
      //   date: DateTime(2023, 7, 13, 14, 45),
      // ),
    ];

    // Sort the tips by date, most recent first
    tips.sort((a, b) => b.date.compareTo(a.date));

    return tips;
  }
}
