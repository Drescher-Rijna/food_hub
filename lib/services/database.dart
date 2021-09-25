import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/models/User.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {

// VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES VALUES
  final String uid;

  DatabaseService({ this.uid });


// USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS USERS
  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  // creating the user document
  Future<void> updateUserData(String username, String email) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'ActiveID': 'noIDisChoosen',
      'showAlerts': false,
    });
  }

  // trick list from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.id,
      username: snapshot['username'],
    );
  }

  // get users stream
  Stream<UserData> get users {
    return userCollection.doc(FirebaseAuth.instance.currentUser.uid).snapshots().
    map(_userDataFromSnapshot);
  }




}