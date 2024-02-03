import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

class DataService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('users');

  Future<UserData> fetchUserData(String userId) async {
    try {
      DataSnapshot snapshot = await _databaseReference.child(userId).once() as DataSnapshot;

      Map<dynamic, dynamic>? userDataMap =
          snapshot.value as Map<dynamic, dynamic>?;

      if (userDataMap != null) {
        Map<String, dynamic>? sensorDataMap =
            userDataMap['sensor'] as Map<String, dynamic>?;

        if (sensorDataMap != null) {
          SensorData sensorData = SensorData(
            ec: sensorDataMap['EC'] ?? 0.0,
            ph: sensorDataMap['PH'] ?? 0.0,
            tds: sensorDataMap['TDS'] ?? 0.0,
            temperature: sensorDataMap['Temperature'] ?? 0.0,
          );

          return UserData(
            userId: userId,
            email: userDataMap['email'] ?? '',
            firstName: userDataMap['firstName'] ?? '',
            lastName: userDataMap['lastName'] ?? '',
            sensorData: sensorData,
          );
        }
      }

      throw 'User data not found';
    } catch (error) {
      print('Error fetching user data: $error');
      throw error;
    }
  }
}
