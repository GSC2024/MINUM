import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

class DataService {
  Future<UserData?> fetchData() async {
    final ref = FirebaseDatabase.instance.ref().child('Sensor');
    try {
      final snapshot = await ref.get();

      if (snapshot.exists) {
        // Handle the data and cast it properly
        double? phData = (snapshot.child('PH_data').value as num?)?.toDouble();
        double? tdsData = (snapshot.child('TDS_data').value as num?)?.toDouble();
        double? turbyData = (snapshot.child('Turby_data').value as num?)?.toDouble();
        double? orpData = (snapshot.child('orp_data').value as num?)?.toDouble();

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