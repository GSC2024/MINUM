import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

class DataService {
  Future<UserData?> fetchData() async {
    final ref = FirebaseDatabase.instance.ref();
    try {
      final snapshot = await ref.child('Sensor').get();

      if (snapshot.exists) {
        // Accessing sensor data with null checks
        double? phData = snapshot.child('PH_data').value as double?;
        double? tdsData = snapshot.child('TDS_data').value as double?;
        double? turbyData = snapshot.child('Turby_data').value as double?;
        double? orpData = snapshot.child('orp_data').value as double?;

        // Create and return UserData object
        return UserData(
          ph: phData,
          tds: tdsData,
          turbidity: turbyData,
          orp: orpData,
        );
      } else {
        print('No data available at the specified path');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
