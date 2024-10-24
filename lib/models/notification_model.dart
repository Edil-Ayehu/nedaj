class NotificationModel {
  final String title;
  final String description;
  final DateTime date;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
  });

  static final List<NotificationModel> notifications = [
    NotificationModel(
        title: 'Fuel Payment Confirmed.',
        description:
            'Your fuel payment of 800.00 Birr is successful! Your car is now fueled and ready to go. Thank you for using Nedaj!',
        date: DateTime.now()),
    NotificationModel(
        title: 'Car Added Successfully',
        description:
            'Your fuel payment of 800.00 Birr is successful! Your car is now fueled and ready to go. Thank you for using Nedaj!',
        date: DateTime.now()),
    NotificationModel(
      title: 'Car Added Successfully',
      description:
          'Car [Code 02, AA-A47893] to successfully added to your car lists. ',
      date: DateTime(2020, 6, 13, 8, 45),
    ),
    NotificationModel(
      title: 'Car Added Successfully',
      description:
          'Your fuel payment of 800.00 Birr is successful! Your car is now fueled and ready to go. Thank you for using Nedaj!',
      date: DateTime(2024, 6, 13, 8, 45),
    ),
    NotificationModel(
      title: 'Car Added Successfully',
      description:
          'Car [Code 02, AA-A47893] to successfully added to your car lists. ',
      date: DateTime(2023, 6, 13, 8, 45),
    ),
  ];
}
