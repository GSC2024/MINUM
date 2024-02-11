import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart'; // Import the UserData class

class SensorDataService {
  Future<void> saveSensorData(String userId, UserData userData) async {
    try {
      // Get the current date
      DateTime currentDate = DateTime.now();

      // Format the date to YYYY-MM-DD
      String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";

      // Path to store sensor data
      String sensorDataPath = 'sensor_data/$userId/$formattedDate';

      // Reference to the sensor data path
      DatabaseReference sensorDataRef = FirebaseDatabase.instance.reference().child(sensorDataPath);

      // Save sensor data
      await sensorDataRef.set({
        'EC': userData.ec,
        'PH': userData.ph,
        'TDS': userData.tds,
        'Temperature': userData.temperature,
      });

      print('Sensor data saved successfully!');
    } catch (error) {
      print('Error saving sensor data: $error');
      throw error;
    }
  }
}
