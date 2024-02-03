// user_data.dart

class SensorData {
  final double ec;
  final double ph;
  final double tds;
  final double temperature;

  SensorData({
    required this.ec,
    required this.ph,
    required this.tds,
    required this.temperature,
  });
}

class UserData {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final SensorData sensorData;

  UserData({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.sensorData,
  });
}
