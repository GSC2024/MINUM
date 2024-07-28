import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

Future<void> saveSensorData(UserData userData) async {
  try {
    DateTime currentDate = DateTime.now();
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    String sensorDataPath = 'Sensor/$formattedDate';
    DatabaseReference sensorDataRef = FirebaseDatabase.instance.ref().child(sensorDataPath);
    
    await sensorDataRef.set({
      'PH': userData.ph,
      'TDS': userData.tds,
      'TURBIDITY': userData.turbidity,
      'ORP': userData.orp, // Save ORP data as well
    });

    print('Sensor data saved successfully!');
  } catch (error) {
    print('Error saving sensor data: $error');
    throw error;
  }
}
