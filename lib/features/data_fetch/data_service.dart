// data_service.dart

import 'package:firebase_database/firebase_database.dart';
import '../user_data.dart';

class DataService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('users');

  Future<List<UserData>> fetchData() async {
    try {
      DatabaseEvent event = await _databaseReference.once();
      DataSnapshot snapshot = event.snapshot;

      List<UserData> userDataList = [];
      Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;
      if (values != null) {
        values.forEach((key, value) {
          // Your logic here
          UserData userData = UserData(
            userId: key,
            firstName: value['firstName'],
            lastName: value['lastName'],
            email: value['email'],
          );
          userDataList.add(userData);
        });
      }

      return userDataList;
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow the error to handle it where fetchData is called
    }
  }
}
