import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class Dbmethods {
  final CollectionReference obj = FirebaseFirestore.instance.collection("barberinfo");

  Future<void> adduser(String name, String email, String password) async {
    String id = randomAlphaNumeric(10);
    try {
      await obj.doc(id).set({
        "name": name,
        "email": email,
        "password": password,
        "idCreated": DateTime.now().toIso8601String()
      });
      print("User added to Firestore: $id");
    } catch (e) {
      print("Error adding user: $e");
    }
  }
}
