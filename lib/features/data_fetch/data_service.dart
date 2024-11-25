import 'package:firebase_database/firebase_database.dart';
import '../save_data.dart';
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
      double? tds = snapshot.child('sensor/TDS').value as double?;
      double? turbidity = snapshot.child('sensor/Turbidity').value as double?;
      double? ph = snapshot.child('sensor/PH').value as double?;
      double? orp =
          snapshot.child('sensor/ORP').value as double?; // Added ORP sensor

      // Create and return UserData object
      return UserData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        tds: tds,
        turbidity: turbidity,
        ph: ph,
        orp: orp,
      );
    } else {
      print('No data available.');
      return null;
    }
  }

  Future<List<SaveData>> fetchSaveData(String userId) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('users/$userId/saveData').orderByKey().get();

    final List<SaveData> saveDataList = [];

    if (snapshot.exists && snapshot.value != null) {
      print('Fetching save data...');

      if (snapshot.value is Map<dynamic, dynamic>) {
        final Map<dynamic, dynamic> saveDataMap =
            snapshot.value as Map<dynamic, dynamic>;

        saveDataMap.forEach((date, data) {
          if (data is Map<String, dynamic>) {
            // Parse sensor readings
            double? ph = data['PH']?.toDouble();
            double? tds = data['TDS']?.toDouble();
            double? turbidity = data['TURBIDITY']?.toDouble();
            double? orp = data['ORP']?.toDouble(); // Added ORP sensor
            int percentage = data['Percentage'] as int;

            // Parse date string into DateTime object
            DateTime parsedDate = DateTime.parse(date.toString());

            // Create SaveData object
            SaveData saveData = SaveData(
              date: parsedDate,
              ph: ph,
              tds: tds,
              turbidity: turbidity,
              orp: orp, // Include ORP in SaveData
              percentage: percentage,
            );

            // Add SaveData object to the list
            saveDataList.add(saveData);
          }
        });
      } else {
        print('Save data is not in expected format: ${snapshot.value}');
      }
    } else {
      print('No save data available.');
    }

    return saveDataList;
  }
}
