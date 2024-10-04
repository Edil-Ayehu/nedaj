class Car {
  final int plateNumber;
  final int code;
  final String addedTime;
  final String region;

  Car({
    required this.plateNumber,
    required this.code,
    required this.addedTime,
    required this.region,
  });

  static final List<Car> registeredVehicles = [
    Car(
      plateNumber: 23493,
      code: 2,
      addedTime: '2 hours ago',
      region: 'AA',
    ),
    Car(
      plateNumber: 53643,
      code: 3,
      addedTime: 'in a few seconds',
      region: 'OR',
    ),
    Car(
      plateNumber: 97543,
      code: 1,
      addedTime: '2 hours ago',
      region: 'TR',
    ),
    Car(
      plateNumber: 09743,
      code: 4,
      addedTime: '45 minutes ago',
      region: 'SR',
    ),
  ];
}
