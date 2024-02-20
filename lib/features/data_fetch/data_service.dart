import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

class DataService {

  Future<UserData?> fetchData(String userId) async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$userId').get();

  if (snapshot.exists) {
    // Accessing individual fields with null checks
    String? firstName = snapshot.child('firstName').value as String?;
    String? lastName = snapshot.child('lastName').value as String?;
    String? email = snapshot.child('email').value as String?;

    // Accessing nested sensor data with null checks
    int? tds = snapshot.child('sensor/TDS').value as int?;
    int? temperature = snapshot.child('sensor/Temperature').value as int?;
    double? ph = snapshot.child('sensor/PH').value as double?;
    int? ec = snapshot.child('sensor/EC').value as int?;

    // Create and return UserData object
    return UserData(
      firstName: firstName,
      lastName: lastName,
      email: email,
      tds: tds,
      temperature: temperature,
      ph: ph,
      ec: ec,
    );
  } else {
    print('No data available.');
    return null;
  }
}

}
