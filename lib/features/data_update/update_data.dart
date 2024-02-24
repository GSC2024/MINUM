import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

void updateField(String userId, bool newValue) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print('User is not authenticated.');
    return;
  }

  final ref = FirebaseDatabase.instance.ref().child('users/$userId/device');
  
  ref.set(newValue)
    .then((_) {
      print('Field updated successfully to: $newValue');
    })
    .catchError((error) {
      print('Failed to update field: $error');
    });
}

