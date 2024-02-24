import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

  Future<void> saveSensorData(String userId, UserData userData) async {
    try {
      DateTime currentDate = DateTime.now();
      String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
      String sensorDataPath = 'users/$userId/saveData/$formattedDate';
      DatabaseReference sensorDataRef = FirebaseDatabase.instance.ref().child(sensorDataPath);
            
      await sensorDataRef.set({
        'PH': userData.ph,
        'TDS': userData.tds,
        'TURBIDITY': userData.turbidity,
      });

      print('Sensor data saved successfully!');
    } catch (error) {
      print('Error saving sensor data: $error');
      throw error;
    }
  }

