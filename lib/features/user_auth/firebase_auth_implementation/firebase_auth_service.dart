import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> signUpWithEmailAndPassword(
      String email, String password, String firstName, String lastName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Save user information to Realtime Database
      if (credential.user != null) {
        await saveUserInfoToDatabase(
            credential.user!.uid, firstName, lastName, email);
        return {'user': credential.user, 'userId': credential.user!.uid};
      }
    } catch (e) {
      print("Error Sign Up");
    }
    return null;
  }

  Future<Map<String, dynamic>?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential.user != null) {
        return {'user': credential.user, 'userId': credential.user!.uid};
      }
    } catch (e) {
      print("Error Sign In");
    }
    return null;
  }

  Future<void> saveUserInfoToDatabase(
      String userId, String firstName, String lastName, String email) async {
    final databaseReference = FirebaseDatabase.instance.ref();

    await databaseReference.child('users').child(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }
}
